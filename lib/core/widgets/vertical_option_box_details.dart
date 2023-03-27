import 'package:flutter/material.dart';

import '../../features/home/data/models/car_model.dart';
import 'vertical_option_details_item.dart';

class VerticalOptionBoxDetails extends StatelessWidget {
  final CarModel car;
  const VerticalOptionBoxDetails({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VerticalOptionDetailsItem(
          imagePath: 'assets/images/car_icons/transmission.png',
          title: car.transmission,
          description: 'Transmission Type',
        ),
        VerticalOptionDetailsItem(
          imagePath: 'assets/images/car_icons/traction.png',
          title: car.traction,
          description: 'Traction Type',
        ),
      ],
    );
  }
}
