import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
class CarCenterDetailsBody extends StatelessWidget {
  const CarCenterDetailsBody({Key? key, required this.carCenterModel}) : super(key: key);
final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Car Centers Details"),
    );
  }
}
