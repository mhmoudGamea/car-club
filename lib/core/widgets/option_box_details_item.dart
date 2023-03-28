import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OptionBoxDetailsItem extends StatelessWidget {
  final String imagePath;
  final String description;
  final String title;
  final double iconWidth;

  const OptionBoxDetailsItem({
    Key? key,
    required this.imagePath,
    required this.description,
    required this.title,
    this.iconWidth = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          color: greyColor,
          width: iconWidth,
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: Styles.title14.copyWith(color: blackColor),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: Styles.title13.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
