class HttpException implements Exception {
  const HttpException(this.description);

  /// Textual description of the error.
  final String description;

  @override
  String toString() => description;
}
