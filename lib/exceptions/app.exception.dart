class AppException implements Exception {
  AppException(this.message);

  final String message;

  String toString() => message;
}
