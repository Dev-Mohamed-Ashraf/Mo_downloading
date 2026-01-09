import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/error/exceptions.dart';
import '../models/status_model.dart';

abstract class StatusLocalDataSource {
  Future<List<StatusModel>> getStatuses();
  Future<void> saveStatus(StatusModel status);
}

class StatusLocalDataSourceImpl implements StatusLocalDataSource {
  static const platform = MethodChannel('com.example.my_flutter_app/media');

  @override
  Future<List<StatusModel>> getStatuses() async {
    // Check permissions first
    if (!await Permission.manageExternalStorage.isGranted) {
      final status = await Permission.manageExternalStorage.request();
      if (!status.isGranted) {
        // Try falling back to basic storage permission
        if (!await Permission.storage.isGranted) {
          final storageStatus = await Permission.storage.request();
          if (!storageStatus.isGranted) {
             throw PermissionException('Need storage permission to fetch statuses');
          }
        }
      }
    }

    final List<String> statusPaths = [
      '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses',
      '/storage/emulated/0/WhatsApp/Media/.Statuses',
      '/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses',
      '/storage/emulated/0/WhatsApp Business/Media/.Statuses',
    ];

    List<StatusModel> statuses = [];
    bool foundDir = false;

    for (final path in statusPaths) {
      final statusDir = Directory(path);
      if (await statusDir.exists()) {
        foundDir = true;
        final items = statusDir.listSync();
        
        // Grab only the files we care about
        final validItems = items.where((item) {
          final path = item.path.toLowerCase();
          return path.endsWith('.jpg') ||
              path.endsWith('.jpeg') ||
              path.endsWith('.png') ||
              path.endsWith('.gif') ||
              path.endsWith('.mp4') ||
              path.endsWith('.avi') || 
              path.endsWith('.mov') || 
              path.endsWith('.3gp') ||
              path.endsWith('.mkv');
        }).toList();

        // Show newest statuses first
        validItems.sort((a, b) {
          return b.statSync().modified.compareTo(a.statSync().modified);
        });

        statuses.addAll(validItems.map((e) => StatusModel.fromFileSystemEntity(e)));
      }
    }

    // Nothing found?
    if (!foundDir && statuses.isEmpty) {
      return []; 
    }

    // Double check sort order
    statuses.sort((a, b) => b.file.statSync().modified.compareTo(a.file.statSync().modified));

    return statuses;
  }

  @override
  Future<void> saveStatus(StatusModel status) async {
    // Make sure we have write permission
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    bool hasPermission = (statuses[Permission.storage]?.isGranted ?? false) ||
        (statuses[Permission.manageExternalStorage]?.isGranted ?? false);

    if (!hasPermission) {
      throw PermissionException('Storage permission denied');
    }

    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw StorageException('Cannot access storage directory');
    }

    // Setup download path
    String downloadsPath = '';
    if (Platform.isAndroid) {
      downloadsPath = '/storage/emulated/0/Download/StatusDownloader';
    } else {
      downloadsPath = '${directory.path}/StatusDownloader';
    }

    final downloadsDir = Directory(downloadsPath);
    if (!await downloadsDir.exists()) {
      try {
        await downloadsDir.create(recursive: true);
      } catch (e) {
        throw StorageException('Failed to create directory: $e');
      }
    }

    // Create unique filename
    final extension = status.path.split('.').last;
    final fileName = 'status_${DateTime.now().millisecondsSinceEpoch}.$extension';
    final newPath = '${downloadsDir.path}/$fileName';

    try {
      await File(status.path).copy(newPath);
      
      // Let the gallery know about the new file
      try {
        await platform.invokeMethod('scanFile', {'path': newPath});
      } on PlatformException catch (_) {
        // Scan failed, but file is there. No big deal.
      }
      
    } catch (e) {
      throw StorageException('Failed to copy file: $e');
    }
  }
}
