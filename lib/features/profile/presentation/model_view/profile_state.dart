part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
}
class ProfileImagePickedSuccessState extends ProfileState{}
class ProfileImagePickedErrorState extends ProfileState{}

class GetUsersLoading extends ProfileState{}
class GetUsersSuccess extends ProfileState{}
class GetUsersFailure extends ProfileState{}