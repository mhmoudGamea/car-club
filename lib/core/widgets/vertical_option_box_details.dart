import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

import './option_box_details_item.dart';

class VerticalOptionBoxDetails extends StatelessWidget {
  const VerticalOptionBoxDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        VerticalOptionDetailsItem(
          imagePath: 'assets/images/climate-change.png',
          title: 'Climate Control',
          description: 'Two-Zone',
          more: '23.5 c',
        ),
        VerticalOptionDetailsItem(
          imagePath: 'assets/images/pressure.png',
          title: 'Type Pressure',
          description: 'Last Update: 7m ago',
          more: '23.5 Bar',
        ),
      ],
    );
  }
}

class VerticalOptionDetailsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String more;
  const VerticalOptionDetailsItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.more});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff282A3E),
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
          const SizedBox(height: 10),
          Text(
            more,
            style: Styles.title14.copyWith(color: const Color(0xffB7DFFF)),
          )
        ],
      ),
    );
  }
}
