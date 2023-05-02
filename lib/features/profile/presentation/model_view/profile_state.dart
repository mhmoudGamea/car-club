part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
}
class ProfileImagePickedSuccessState extends ProfileState{}
class ProfileImagePickedErrorState extends ProfileState{}