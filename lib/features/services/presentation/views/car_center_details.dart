import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';

import 'widgets/car_center_details_body.dart';

class CarCenterDetails extends StatelessWidget {
  const CarCenterDetails({Key? key, required this.carCenterModel})
      : super(key: key);
  static const rn = '/CarCenterDetails';
  final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
    return CarCenterDetailsBody(
      carCenterModel: carCenterModel,
    );
  }
}
