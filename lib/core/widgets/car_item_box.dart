import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/assets.dart';
import '../utils/styles.dart';

class CarItemBox extends StatelessWidget {
  const CarItemBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    car,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Positioned(
              //   right: 10,
              //   top: 10,
              //   child: Container(
              //     width: 30,
              //     height: 30,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(15)),
              //     child: const Icon(
              //       Icons.favorite_rounded,
              //       color: Color(0xff64636A),
              //     ),
              //   ),
              // ),
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
                        color: textButtonColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.favorite_rounded,
                      color: Color(0xff64636A),
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
                        const FaIcon(
                          FontAwesomeIcons.bolt,
                          color: secondaryDark,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '571 hp',
                          style: Styles.titleSmall
                              .copyWith(color: const Color(0xff171820)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.stopwatch,
                          color: secondaryDark,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '5.2 sec',
                          style: Styles.titleSmall
                              .copyWith(color: const Color(0xff171820)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.dollarSign,
                          color: secondaryDark,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '2100',
                          style: Styles.titleSmall
                              .copyWith(color: const Color(0xff171820)),
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
