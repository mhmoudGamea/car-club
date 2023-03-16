class MaxNumberOfImagesError implements Exception {
  final String errorMessage;

  MaxNumberOfImagesError(this.errorMessage);
  @override
  String toString() {
    return errorMessage;
  }
}
