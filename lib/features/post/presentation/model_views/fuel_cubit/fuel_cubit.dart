import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fuel_state.dart';

class FuelCubit extends Cubit<FuelState> {
  FuelCubit() : super(FuelInitial());

  static const List<String> _fuelTypes = [
    'Diesel',
    'Petrol',
    'Electric',
    'Lpg',
  ];

  List<String> get getFuelTypesList {
    return [..._fuelTypes];
  }

  String? _fuelType;

  set setFuelType(String fuelType) {
    _fuelType = fuelType;
    emit(FuelSelected());
  }

  String? get getFuelType {
    return _fuelType;
  }
}
