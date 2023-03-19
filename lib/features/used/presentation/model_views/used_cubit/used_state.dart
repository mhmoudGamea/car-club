part of 'used_cubit.dart';

@immutable
abstract class UsedState {}

class UsedInitial extends UsedState {}

class UsedCarPostLoading extends UsedState {}

class UsedCarPostSuccess extends UsedState {}

class UsedCarPostFailure extends UsedState {}
