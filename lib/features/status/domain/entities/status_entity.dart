import 'dart:io';
import 'package:equatable/equatable.dart';

enum StatusType { image, video }

class StatusEntity extends Equatable {
  final String path;
  final StatusType type;
  final FileSystemEntity file;

  const StatusEntity({
    required this.path,
    required this.type,
    required this.file,
  });

  @override
  List<Object> get props => [path, type, file];
}
