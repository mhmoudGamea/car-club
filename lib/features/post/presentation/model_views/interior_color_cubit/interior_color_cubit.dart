import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'interior_color_state.dart';

class InteriorColorCubit extends Cubit<InteriorColorState> {
  InteriorColorCubit() : super(InteriorColorInitial());

  Map<String, dynamic> interiorColorList = {
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

  final _interiorColorController = TextEditingController();

  TextEditingController get getInteriorColorController {
    return _interiorColorController;
  }

  String? _interiorColor;

  set setInteriorColor(String? color) {
    _interiorColor = color;
    emit(InteriorColorSelected());
  }

  String? get getInteriorColor {
    return _interiorColor;
  }
}
