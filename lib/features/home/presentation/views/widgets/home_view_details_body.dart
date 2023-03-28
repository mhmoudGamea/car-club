import 'package:flutter/material.dart';

import '../../../../../core/widgets/car_box_preview_details.dart';
import '../../../../../core/widgets/dimensions_option_box_details.dart';
import '../../../../../core/widgets/main_option_box_details.dart';
import '../../../../../core/widgets/others_option_box_details.dart';
import '../../../../../core/widgets/vertical_option_box_details.dart';
import '../../../data/models/car_model.dart';

class HomeViewDetailsBody extends StatelessWidget {
  final CarModel car;
  const HomeViewDetailsBody({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CarBoxPreviewDetails(images: car.images),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  MainOptionBoxDetails(car: car),
                  const SizedBox(height: 30),
                  VerticalOptionBoxDetails(car: car),
                  const SizedBox(height: 30),
                  OthersOptionBoxDetails(car: car),
                  const SizedBox(height: 30),
                  DimensionsOptionBoxDetails(car: car),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
