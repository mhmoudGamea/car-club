import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/home/data/models/car_model.dart';
import '../utils/styles.dart';

class CarItemBox extends StatelessWidget {
  final CarModel car;
  const CarItemBox({
    Key? key,
    required this.car,
  }) : super(key: key);

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
                    car.images[0],
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
                      '${car.brand} ${car.model}',
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
                  // thickness: 1,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.bolt,
                          color: Colors.black54,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${car.horsepower} hp',
                          style:
                              Styles.titleSmall.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.gaugeHigh,
                          color: Colors.black54,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${car.maxspeed} km/h',
                          style:
                              Styles.titleSmall.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.dollarSign,
                          color: Colors.black54,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${car.price}',
                          style:
                              Styles.titleSmall.copyWith(color: Colors.black54),
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
