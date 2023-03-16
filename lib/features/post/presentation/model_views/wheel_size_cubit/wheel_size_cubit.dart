import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wheel_size_state.dart';

class WheelSizeCubit extends Cubit<WheelSizeState> {
  WheelSizeCubit() : super(WheelSizeInitial());

  static const List<String> _wheelSize = ['15', '16', '17', '18', '19'];

  List<String> get getWheelSize {
    return _wheelSize;
  }

  String? _size;

  String? get getSize {
    return _size;
  }

  set setSize(String? size) {
    _size = size;
    emit(WheelSizeSelected());
  }
}
