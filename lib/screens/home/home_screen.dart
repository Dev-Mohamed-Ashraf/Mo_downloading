import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_flutter_app/screens/about/about_screen.dart';
import 'package:my_flutter_app/widgets/video_player_widget.dart';

class StatusHomePage extends StatefulWidget {
  const StatusHomePage({super.key});

  @override
  State<StatusHomePage> createState() => _StatusHomePageState();
}

class _StatusHomePageState extends State<StatusHomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  bool _isRequestingPermission = false; // Flag to prevent race condition
  late TabController _tabController;
  List<FileSystemEntity> _images = [];
  List<FileSystemEntity> _videos = [];
  bool _isLoading = true;
  String _message = 'جاري التحقق من الصلاحيات...';
  bool _arePermissionsGranted = false; // للتحقق من الصلاحيات
  static const platform = MethodChannel('com.example.my_flutter_app/media');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addObserver(this); // Add observer
    _checkPermissionsAndGetStatuses();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Only check permissions on resume if a request is not already in progress.
    if (state == AppLifecycleState.resumed && !_isRequestingPermission) {
      print("App resumed, checking permissions...");
      _checkPermissionsAndGetStatuses();
    }
  }

  // Request "All Files Access" permission which is required for Android 11+
  Future<void> _requestStoragePermissions() async {
    // Set flag to true to prevent didChangeAppLifecycleState from running a check
    _isRequestingPermission = true;

    await Permission.manageExternalStorage.request();

    // After the user returns from settings, check the status and update the UI.
    await _checkPermissionsAndGetStatuses();

    // Reset the flag
    _isRequestingPermission = false;
  }

  @override
  void dispose() {
    _tabController.dispose();
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    super.dispose();
  }

  Future<void> _checkPermissionsAndGetStatuses() async {
    // On modern Android, "All Files Access" is required to access WhatsApp's folder.
    final bool hasPermission = await Permission.manageExternalStorage.isGranted;
    print('حالة صلاحية الوصول الكامل للملفات: $hasPermission');

    if (mounted) {
      setState(() {
        _arePermissionsGranted = hasPermission;
        if (!hasPermission) {
          _isLoading = false;
          _message =
              'يحتاج التطبيق إلى صلاحية الوصول الكامل للملفات لعرض الحالات.';
        }
      });
    }

    if (hasPermission) {
      print('صلاحية الوصول الكامل للملفات ممنوحة.');
      _getStatuses();
    } else {
      print('صلاحية الوصول الكامل للملفات غير ممنوحة.');
    }
  }

  Future<void> _getStatuses() async {
    setState(() {
      _isLoading = true;
      _message = 'جاري البحث عن الحالات...';
    });

    // قائمة بالمسارات المحتملة للحالات
    final List<String> statusPaths = [
      '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses', // واتساب الرسمي (أندرويد 11+)
      '/storage/emulated/0/WhatsApp/Media/.Statuses', // واتساب الرسمي (أندرويد 10 أو أقل)
      '/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses', // واتساب بزنس (أندرويد 11+)
      '/storage/emulated/0/WhatsApp Business/Media/.Statuses', // واتساب بزنس (أندرويد 10 أو أقل)
    ];

    bool found = false;
    for (final path in statusPaths) {
      final statusDir = Directory(path);
      if (await statusDir.exists()) {
        final items = statusDir.listSync();
        print('تم العثور على مجلد الحالات: $path');
        print('عدد الملفات: ${items.length}');
        for (var item in items) {
          print('حالة: ${item.path}');
        }
        setState(() {
          // دعم كل امتدادات الصور والفيديوهات الشائعة
          _images =
              items
                  .where(
                    (item) =>
                        item.path.endsWith('.jpg') ||
                        item.path.endsWith('.jpeg') ||
                        item.path.endsWith('.png') ||
                        item.path.endsWith('.gif'),
                  )
                  .toList();
          _videos =
              items
                  .where(
                    (item) =>
                        item.path.endsWith('.mp4') ||
                        item.path.endsWith('.3gp') ||
                        item.path.endsWith('.mkv'),
                  )
                  .toList();
          _isLoading = false;
          if (_images.isEmpty && _videos.isEmpty) {
            _message =
                'لم يتم العثور على حالات في: $path. الرجاء مشاهدة بعض الحالات في واتساب أولاً.';
          } else {
            _message = 'تم العثور على حالات في: $path';
          }
        });
        found = true;
        break;
      } else {
        print('لم يتم العثور على مجلد: $path');
      }
    }
    if (!found) {
      setState(() {
        _isLoading = false;
        _message =
            'لم يتم العثور على أي مجلد حالات واتساب أو واتساب بزنس.\nتأكد من منح كل الصلاحيات ومشاهدة بعض الحالات في واتساب.';
      });
      print('لم يتم العثور على أي مجلد حالات في جميع المسارات المحتملة!');
    }
  }

  static const mediaChannel = const MethodChannel(
    'com.example.my_flutter_app/media',
  );

  Future<void> _downloadStatus(FileSystemEntity file, bool isVideo) async {
    try {
      // Request storage permissions. This will request whatever is necessary for the platform.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage, // For older Android versions
        Permission.manageExternalStorage, // For Android 11+
      ].request();

      // Check if at least one of the necessary permissions has been granted.
      bool hasSufficientPermission =
          (statuses[Permission.storage]?.isGranted ?? false) ||
          (statuses[Permission.manageExternalStorage]?.isGranted ?? false);

      print('Storage permission granted: ${statuses[Permission.storage]?.isGranted}');
      print('Manage external storage permission granted: ${statuses[Permission.manageExternalStorage]?.isGranted}');

      if (!hasSufficientPermission) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('يجب منح أذونات التخزين لحفظ الملفات.'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return; // Stop if permission is not granted
      }

      // Get external storage directory
      final directory = await getExternalStorageDirectory();
      if (directory == null) {
        throw 'لا يمكن الوصول إلى مجلد التخزين';
      }

      // For Android 10+, we need to use a different path
      String downloadsPath = '';
      if (Platform.isAndroid) {
        downloadsPath = '/storage/emulated/0/Download/StatusDownloader';
      } else {
        downloadsPath = '${directory.path}/StatusDownloader';
      }

      // Create StatusDownloader directory if it doesn't exist
      final downloadsDir = Directory(downloadsPath);
      if (!await downloadsDir.exists()) {
        print('Creating directory: $downloadsPath');
        try {
          await downloadsDir.create(recursive: true);
          print('Directory created successfully');
        } catch (e) {
          print('Error creating directory: $e');
          throw 'فشل في إنشاء المجلد: $e';
        }
      }

      // Copy file to download directory
      final fileName =
          'status_${DateTime.now().millisecondsSinceEpoch}${isVideo ? '.mp4' : '.jpg'}';
      final newPath = '${downloadsDir.path}/$fileName';

      print('Copying file from ${file.path} to $newPath');
      try {
        await File(file.path).copy(newPath);
        print('File copied successfully');
      } catch (e) {
        print('Error copying file: $e');
        throw 'فشل في نسخ الملف: $e';
      }

      // Scan the file to make it visible in gallery (Android only)
      try {
        await mediaChannel.invokeMethod('scanFile', {'path': newPath});
      } on PlatformException catch (e) {
        print("Failed to scan file: '${e.message}'.");
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isVideo ? 'تم حفظ الفيديو بنجاح!' : 'تم حفظ الصورة بنجاح!',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Error saving status: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ أثناء الحفظ: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<Uint8List?> _generateThumbnail(String videoPath) async {
    return await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );
  }

  void _showPreviewDialog(FileSystemEntity file, bool isVideo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child:
                    isVideo
                        ? VideoPlayerWidget(videoPath: file.path)
                        : Image.file(File(file.path)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      _downloadStatus(file, isVideo);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusGrid(List<FileSystemEntity> statuses, bool isVideo) {
    if (statuses.isEmpty) {
      return Center(child: Text(isVideo ? 'لا توجد فيديوهات' : 'لا توجد صور'));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: statuses.length,
      itemBuilder: (context, index) {
        final status = statuses[index];
        return GestureDetector(
          onTap: () => _showPreviewDialog(status, isVideo),
          child:
              isVideo
                  ? FutureBuilder<Uint8List?>(
                    future: _generateThumbnail(status.path),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData &&
                          snapshot.data != null) {
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.memory(snapshot.data!, fit: BoxFit.cover),
                            const Center(
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        );
                      }
                      return Container(
                        color: Colors.black,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                  )
                  : Image.file(File(status.path), fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildPermissionRequestView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.folder_special_outlined,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            const Text(
              'مطلوب صلاحية الوصول الكامل للملفات',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'لعرض حالات واتساب من مجلدات النظام، يحتاج التطبيق إلى إذن "الوصول إلى كل الملفات". اضغط على الزر أدناه للانتقال إلى الإعدادات ومنح الإذن.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings_outlined),
              onPressed: _requestStoragePermissions,
              label: const Text('فتح الإعدادات ومنح الإذن'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مو تحميل'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
        bottom:
            _arePermissionsGranted
                ? TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  indicatorColor: Colors.white,
                  tabs: const [Tab(text: 'الصور'), Tab(text: 'الفيديوهات')],
                )
                : null,
      ),
      body:
          !_arePermissionsGranted
              ? _buildPermissionRequestView()
              : _isLoading
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(_message),
                  ],
                ),
              )
              : TabBarView(
                controller: _tabController,
                children: [
                  _buildStatusGrid(_images, false),
                  _buildStatusGrid(_videos, true),
                ],
              ),
      floatingActionButton:
          _arePermissionsGranted
              ? FloatingActionButton(
                onPressed: _getStatuses,
                backgroundColor: Colors.green,
                child: const Icon(Icons.refresh, color: Colors.white),
              )
              : null,
    );
  }
}
