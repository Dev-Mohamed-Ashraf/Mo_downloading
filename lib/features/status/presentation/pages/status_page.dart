import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';

import '../../../../core/error/failures.dart';
import '../../domain/entities/status_entity.dart';
import '../bloc/status_bloc.dart';
import '../bloc/status_event.dart';
import '../bloc/status_state.dart';
import '../../../../core/di/injection_container.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StatusBloc>()..add(const StatusEvent.getStatuses()),
      child: const _StatusPageView(),
    );
  }
}

class _StatusPageView extends StatefulWidget {
  const _StatusPageView();

  @override
  State<_StatusPageView> createState() => _StatusPageViewState();
}

class _StatusPageViewState extends State<_StatusPageView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مو تحميل'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [Tab(text: 'الصور'), Tab(text: 'الفيديوهات')],
        ),
      ),
      body: BlocConsumer<StatusBloc, StatusState>(
        listener: (context, state) {
          state.mapOrNull(
            saved: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value.message),
                  backgroundColor: Colors.green,
                ),
              );
            },
            error: (value) {
              // Only show snackbar for save errors, not load errors (which are shown in body)
              if (value.message.contains('saving')) {
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) {
              if (message.contains('Permission') || message.contains('Full file access')) {
                return _buildPermissionRequestView(context);
              }
              return Center(child: Text(message));
            },
            loaded: (images, videos) {
              return TabBarView(
                controller: _tabController,
                children: [
                   _StatusGrid(statuses: images, isVideo: false),
                   _StatusGrid(statuses: videos, isVideo: true),
                ],
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<StatusBloc>().add(const StatusEvent.getStatuses());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  Widget _buildPermissionRequestView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.folder_off, size: 80, color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            'مطلوب صلاحية الوصول',
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<StatusBloc>().add(const StatusEvent.getStatuses());
            },
            child: const Text('منح الصلاحية'),
          ),
        ],
      ),
    );
  }
}

class _StatusGrid extends StatelessWidget {
  final List<StatusEntity> statuses;
  final bool isVideo;

  const _StatusGrid({required this.statuses, required this.isVideo});

  @override
  Widget build(BuildContext context) {
    if (statuses.isEmpty) {
      return Center(
        child: Text(isVideo ? 'لا توجد فيديوهات' : 'لا توجد صور'),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: statuses.length,
      itemBuilder: (context, index) {
        final status = statuses[index];
        return GestureDetector(
          onTap: () => _showPreviewDialog(context, status),
          child: isVideo ? _VideoThumbnail(path: status.path) : Image.file(File(status.path), fit: BoxFit.cover),
        );
      },
    );
  }

  void _showPreviewDialog(BuildContext context, StatusEntity status) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: status.type == StatusType.video
                  ? const Center(child: Icon(Icons.videocam, size: 100)) // Placeholder for video player to simplify
                  : Image.file(File(status.path)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('إغلاق'),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text('حفظ'),
                  onPressed: () {
                    context.read<StatusBloc>().add(StatusEvent.saveStatus(status));
                    Navigator.pop(ctx);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoThumbnail extends StatefulWidget {
  final String path;
  const _VideoThumbnail({required this.path});

  @override
  State<_VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<_VideoThumbnail> {
  Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final bytes = await VideoThumbnail.thumbnailData(
      video: widget.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );
    if (mounted) setState(() => _bytes = bytes);
  }

  @override
  Widget build(BuildContext context) {
    if (_bytes == null) return const Center(child: CircularProgressIndicator());
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.memory(_bytes!, fit: BoxFit.cover),
        const Center(child: Icon(Icons.play_circle_outline, color: Colors.white)),
      ],
    );
  }
}
