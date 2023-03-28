part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class CarOwnerAddressLoading extends MapState {}

class CarOwnerAddressSuccess extends MapState {
  final LocationModel locationModel;
  CarOwnerAddressSuccess({required this.locationModel});
}

class CarOwnerAddressFailure extends MapState {}
