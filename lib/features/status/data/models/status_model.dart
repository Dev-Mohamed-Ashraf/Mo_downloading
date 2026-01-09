import 'dart:io';
import '../../domain/entities/status_entity.dart';

class StatusModel extends StatusEntity {
  const StatusModel({
    required super.path,
    required super.type,
    required super.file,
  });

  factory StatusModel.fromFileSystemEntity(FileSystemEntity file) {
    final type = file.path.toLowerCase().endsWith('.mp4') ||
            file.path.toLowerCase().endsWith('.3gp') ||
            file.path.toLowerCase().endsWith('.mkv')
        ? StatusType.video
        : StatusType.image;

    return StatusModel(
      path: file.path,
      type: type,
      file: file,
    );
  }
}
