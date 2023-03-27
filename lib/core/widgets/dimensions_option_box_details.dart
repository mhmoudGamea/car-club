import 'package:flutter/material.dart';

import '../../features/home/data/models/car_model.dart';
import '../constants.dart';
import 'option_box_details_item.dart';

class DimensionsOptionBoxDetails extends StatelessWidget {
  final CarModel car;
  const DimensionsOptionBoxDetails({
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
          color: greyColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptionBoxDetailsItem(
            imagePath: 'assets/images/car_icons/length.png',
            title: '${car.length} mm',
            description: 'Length',
          ),
          OptionBoxDetailsItem(
            imagePath: 'assets/images/car_icons/width.png',
            title: '${car.width} mm',
            description: 'Width',
          ),
          OptionBoxDetailsItem(
            imagePath: 'assets/images/car_icons/height.png',
            title: '${car.height} mm',
            description: 'Height',
          ),
        ],
      ),
    );
  }
}
