import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/option_box_details_item.dart';
import 'package:flutter/material.dart';

class HorizontalOptionBoxDetails extends StatelessWidget {
  const HorizontalOptionBoxDetails({Key? key}) : super(key: key);

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
        children: const [
          OptionBoxDetailsItem(
            imagePath: 'assets/images/rpm.png',
            title: '6500 rpm',
            description: 'Power',
          ),
          OptionBoxDetailsItem(
            imagePath: 'assets/images/speed.png',
            title: '190 mph',
            description: 'Top Speed',
          ),
          OptionBoxDetailsItem(
            imagePath: 'assets/images/acceleration.png',
            title: '4.4 Sec',
            description: 'Acceleration',
          ),
        ],
      ),
    );
  }
}
