part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CarModel> cars;

  HomeSuccess(this.cars);
}

class HomeFailure extends HomeState {
  final String errMsg;

  HomeFailure(this.errMsg);
}

class IsFavouriteSuccess extends HomeState {}

class IsFavouriteFailure extends HomeState {
  final String errMsg;

  IsFavouriteFailure(this.errMsg);
}

class AlreadyInFavourites extends HomeState {}
