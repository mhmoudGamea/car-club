import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/favourite_box.dart';
import 'package:flutter/material.dart';

class CarBoxPreviewDetails extends StatelessWidget {
  const CarBoxPreviewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffDEE1E7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Image.asset('assets/images/car.png'),
            ),
          ),
          const Positioned(
            bottom: -43,
            right: 20,
            child: FavouriteBox(
                backGroundColor: Color(0xffB7DFFF),
                // backGroundColor: babyBlue,
                color: Color(0xff000000),
                icon: Icons.favorite_rounded),
          ),
        ],
      ),
    );
  }
}
