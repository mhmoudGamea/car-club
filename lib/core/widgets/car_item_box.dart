import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/assets.dart';
import '../utils/styles.dart';

class CarItemBox extends StatelessWidget {
  final String image;
  const CarItemBox({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rolls-Royce Cullinan',
                      style: Styles.titleSmall.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black45,
                  thickness: 1,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bolt,
                          color: Colors.grey[600],
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '571 hp',
                          style: Styles.titleSmall.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.stopwatch,
                          color: Colors.grey[600],
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '5.2 sec',
                          style: Styles.titleSmall.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.dollarSign,
                          color: Colors.grey[600],
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '2100',
                          style: Styles.titleSmall.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
