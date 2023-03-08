part of 'transmission_cubit.dart';

@immutable
abstract class TransmissionState {}

class TransmissionInitial extends TransmissionState {}

class TransmissionSelected extends TransmissionState {}
