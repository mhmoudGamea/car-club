import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/option_box_details_item.dart';

class UsedCarDatesBox extends StatelessWidget {
  final PostModel car;
  const UsedCarDatesBox({Key? key, required this.car}) : super(key: key);

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/year.png',
                description: 'Manufacturing year',
                title: car.manufacturingYear,
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/year.png',
                title: DateFormat.yMMMd().format(DateTime.parse(car.date)),
                description: 'Posted at',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/*


*/