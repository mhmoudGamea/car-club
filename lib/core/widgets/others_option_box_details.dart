import 'package:flutter/material.dart';

import '../../features/home/data/models/car_model.dart';
import '../constants.dart';
import 'option_box_details_item.dart';

class OthersOptionBoxDetails extends StatelessWidget {
  final CarModel car;
  const OthersOptionBoxDetails({
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/speed.png',
                title: '${car.speed}',
                description: 'Speeds',
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/fuel.png',
                title: car.fuel,
                description: 'Fuel',
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/type.png',
                title: car.type,
                description: 'Type',
              ),
            ],
          ),
          // const SizedBox(height: 20),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/wheel.png',
                title: '${car.wheelbase}',
                description: 'Wheel Base',
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/seat.png',
                title: '${car.seats}',
                description: 'Seats',
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/cylinder.png',
                title: '${car.cylinder}',
                description: 'cylinders',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
