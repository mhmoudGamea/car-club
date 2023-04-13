abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);
  factory ServerFailure.fromServerError() {
    return ServerFailure('Connection Error, Please Try Again Later');
  }
}

class FireStoreFailure extends Failure {
  FireStoreFailure(super.error);
  factory FireStoreFailure.fromSendMessage(String error) {
    return FireStoreFailure(error);
  }
}

class MaxNumberOfImagesError implements Exception {
  final String errorMessage;

  MaxNumberOfImagesError(this.errorMessage);
  @override
  String toString() {
    return errorMessage;
  }
}
