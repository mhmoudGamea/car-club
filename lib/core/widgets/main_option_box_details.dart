import 'package:flutter/material.dart';

import '../../features/home/data/models/car_model.dart';
import '../constants.dart';
import 'option_box_details_item.dart';

class MainOptionBoxDetails extends StatelessWidget {
  final CarModel car;
  const MainOptionBoxDetails({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          // color: const Color(0xff282A3E),
          color: greyColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptionBoxDetailsItem(
            imagePath: 'assets/images/car_icons/engine.png',
            title: car.motor,
            description: 'Motor',
          ),
          OptionBoxDetailsItem(
            imagePath: 'assets/images/car_icons/maxspeed.png',
            title: '${car.maxspeed} mph',
            description: 'Top Speed',
          ),
          OptionBoxDetailsItem(
            imagePath: 'assets/images/car_icons/acceleration.png',
            title: '${car.acceleration} Sec',
            description: 'Acceleration',
          ),
        ],
      ),
    );
  }
}
