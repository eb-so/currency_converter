extension ListUtils<T> on List<T>? {
  bool get isNotNullNorEmpty => this != null && this!.isNotEmpty;
}
