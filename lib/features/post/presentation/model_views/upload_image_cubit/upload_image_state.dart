part of 'upload_image_cubit.dart';

@immutable
abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class ImageSelectedSuccess extends UploadImageState {}

class ImageSelectedDeleted extends UploadImageState {}

class ImageAddedToList extends UploadImageState {
  final List<String> list;

  ImageAddedToList(this.list);
}

class UploadImageLoading extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {}
class GetListState extends UploadImageState {}

class UploadImageFailure extends UploadImageState {}
