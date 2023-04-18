abstract class Failure {
  final String errMsg;

  const Failure(this.errMsg);
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

class StorageError extends Failure {
  const StorageError(super.errMsg);

  factory StorageError.fromImageStore(String error) {
    if (error == 'storage/unknown') {
      return const StorageError('An unknown error occured.');
    } else if (error == 'storage/object-not-found') {
      return const StorageError('No object exists at the desired reference.');
    } else if (error == 'storage/quota-exceeded') {
      return const StorageError('Please upgrade to a paid plan.');
    } else if (error == 'storage/unauthenticated') {
      return const StorageError(
          'You aren\'t authenticated, please authenticate and try again.');
    } else if (error == 'storage/unauthorized') {
      return const StorageError(
          'User is not authorized to perform the desired action, check your security rules to ensure they are correct.');
    } else if (error == 'storage/server-file-wrong-size') {
      return const StorageError(
          'File on the client does not match the size of the file recieved by the server. Try uploading again.');
    } else {
      return const StorageError('Please try again later.');
    }
  }
}
