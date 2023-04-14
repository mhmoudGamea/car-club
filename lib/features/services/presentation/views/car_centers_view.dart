import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import 'widgets/car_centers_view_body.dart';
class CarCentersView extends StatelessWidget {
  const CarCentersView({Key? key}) : super(key: key);
  static const rn = '/CarCentersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Helper.normalAppBar(
        context: context,
        title: 'Car Centers',
        backgroundColor: Colors.white,
        color: Colors.black,
        elevation: 1,
      ),
      body: const CarCentersViewBody(),
    );
  }
}
