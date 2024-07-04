class DataMissingException implements Exception {
  DataMissingException(this.message);
  final String message;

  @override
  String toString() {
    return 'DataMissingException: $message';
  }
}
