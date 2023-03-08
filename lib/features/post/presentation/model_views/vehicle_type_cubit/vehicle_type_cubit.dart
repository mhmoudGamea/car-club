import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'vehicle_type_state.dart';

class VehicleTypeCubit extends Cubit<VehicleTypeState> {
  VehicleTypeCubit() : super(VehicleTypeInitial());

  static const List<String> _vehicleTypes = [
    'Coupe',
    'Hatchback',
    'Sedan',
    'SUV',
    'Van',
    'Minivan',
  ];

  List<String> get getVehicleTypesList {
    return [..._vehicleTypes];
  }

  String? _vehicleType;

  set setvehicleType(String vehicleType) {
    _vehicleType = vehicleType;
    emit(VehicleTypeSelected());
  }

  String? get getVehicleType {
    return _vehicleType;
  }
}
