import 'package:flutter/material.dart';

import '../constants.dart';
import 'option_box_details_item.dart';

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
