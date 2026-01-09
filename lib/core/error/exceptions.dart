class ServerException implements Exception {}

class CacheException implements Exception {}

class PermissionException implements Exception {
  final String message;
  PermissionException(this.message);
}

class StorageException implements Exception {
  final String message;
  StorageException(this.message);
}
