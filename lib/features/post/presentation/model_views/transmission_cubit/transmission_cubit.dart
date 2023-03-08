import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'transmission_state.dart';

class TransmissionCubit extends Cubit<TransmissionState> {
  TransmissionCubit() : super(TransmissionInitial());

  static const List<String> _transmissionTypes = [
    'Manual',
    'Automatic',
    'CVT',
  ];

  List<String> get getTransmissionTypesList {
    return [..._transmissionTypes];
  }

  String? _transmissionType;

  set setTransmissionType(String transmissionType) {
    _transmissionType = transmissionType;
    emit(TransmissionSelected());
  }

  String? get getTransmissionType {
    return _transmissionType;
  }
}
