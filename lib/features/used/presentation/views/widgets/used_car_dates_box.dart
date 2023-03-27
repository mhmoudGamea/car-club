import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/widgets/vertical_option_details_item.dart';

class UsedCarDatesBox extends StatelessWidget {
  final PostModel car;
  const UsedCarDatesBox({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VerticalOptionDetailsItem(
          imagePath: 'assets/images/car_icons/year.png',
          description: 'Manufacturing year',
          title: car.manufacturingYear,
        ),
        VerticalOptionDetailsItem(
          imagePath: 'assets/images/car_icons/year.png',
          title: DateFormat.yMMMd().format(DateTime.parse(car.date)),
          description: 'Posted at',
        ),
      ],
    );
  }
}
