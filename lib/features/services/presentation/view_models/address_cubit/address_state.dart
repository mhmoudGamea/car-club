part of 'address_cubit.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class MyLocationLoading extends AddressState {}

class MyLocationSuccess extends AddressState {}

class MyLocationFailure extends AddressState {}
