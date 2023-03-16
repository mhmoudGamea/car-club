part of 'user_form_cubit.dart';

@immutable
abstract class UserFormState {}

class UserFormInitial extends UserFormState {}

class PostLoading extends UserFormState {}

class PostAddedSuccess extends UserFormState {}

class PostAddedFailure extends UserFormState {}
