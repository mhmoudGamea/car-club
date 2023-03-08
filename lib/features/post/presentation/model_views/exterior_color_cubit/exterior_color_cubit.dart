import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exterior_color_state.dart';

class ExteriorColorCubit extends Cubit<ExteriorColorState> {
  ExteriorColorCubit() : super(ExteriorColorInitial());

  // exterior color list part

  Map<String, dynamic> exteriorColorList = {
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
    'Orange': Colors.orange,
    'Red': Colors.red,
    'Black': Colors.black,
    'Grey': Colors.grey,
    'Brown': Colors.brown,
    'Purple': Colors.purple,
    'Pink': Colors.pink,
    'Teal': Colors.teal,
  };

  // text field part

  final _exteriorColorController = TextEditingController();

  TextEditingController get getExteriorColorController {
    return _exteriorColorController;
  }

  String? _exteriorColor;

  set setExteriorColor(String? color) {
    _exteriorColor = color;
    emit(ExteriorColorSelected());
  }

  String? get getExteriorColor {
    return _exteriorColor;
  }
}
