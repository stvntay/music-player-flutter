class ServerException implements Exception {
  dynamic error;

  ServerException(this.error);
}
