import 'package:flutter/material.dart';

import '../../features/home/data/models/car_model.dart';
import '../constants.dart';
import './option_box_details_item.dart';

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

class VerticalOptionDetailsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const VerticalOptionDetailsItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          // color: const Color(0xff282A3E),
          color: greyColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OptionBoxDetailsItem(
            imagePath: imagePath,
            title: title,
            description: description,
          ),
        ],
      ),
    );
  }
}
