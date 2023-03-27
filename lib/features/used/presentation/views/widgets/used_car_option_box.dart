import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/option_box_details_item.dart';

class UsedCarOptionBox extends StatelessWidget {
  final PostModel car;
  const UsedCarOptionBox({Key? key, required this.car}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/transmission.png',
                description: 'Transmission',
                title: car.transmission,
                iconWidth: 18,
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/fuel.png',
                description: 'Fuel',
                title: car.fuel,
                iconWidth: 20,
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/type.png',
                description: 'Type',
                title: car.vehicleType,
                iconWidth: 25,
              ),
            ],
          ),
          const Divider(color: greyColor, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/wheel.png',
                description: 'Wheel Base',
                title: car.wheelSize,
                iconWidth: 20,
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/carOwner.png',
                description: 'NO. owners',
                title: car.noOfOwners,
              ),
              OptionBoxDetailsItem(
                imagePath: 'assets/images/car_icons/mileage.png',
                description: 'Mileage',
                title: '${car.mileage}',
                iconWidth: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
