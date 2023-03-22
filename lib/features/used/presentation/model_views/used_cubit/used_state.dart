part of 'used_cubit.dart';

@immutable
abstract class UsedState {}

class UsedInitial extends UsedState {}

class UsedCarPostsLoading extends UsedState {}

class UsedCarPostsSuccess extends UsedState {
  final List<PostModel> posts;
  UsedCarPostsSuccess({required this.posts});
}

class UsedCarPostsFailure extends UsedState {
  final String error;
  UsedCarPostsFailure({required this.error});
}
