import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OptionBoxDetailsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OptionBoxDetailsItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          color: babyBlue,
          height: 26,
          width: 26,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: Styles.title14.copyWith(
            // color: const Color(0xffB7DFFF),
            color: babyBlue,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: Styles.title12,
        ),
      ],
    );
  }
}
