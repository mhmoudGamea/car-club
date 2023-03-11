part of 'upload_image_cubit.dart';

@immutable
abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class ImageSelectedSuccess extends UploadImageState {}

class ImageSelectedDeleted extends UploadImageState {}

class ImageAddedToList extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {}

class UploadImageFailure extends UploadImageState {}

class MaxNumberOfUploadedImages extends UploadImageState {}
