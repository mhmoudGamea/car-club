import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarBoxItem extends StatelessWidget {
  final String image;
  const CarBoxItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.favorite,
              size: 18,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mini Cooper',
                  style: Styles.title14.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  'This is my small mini cooper blue car',
                  style: Styles.title12.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
