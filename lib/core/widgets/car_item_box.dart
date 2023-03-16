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
        color: const Color(0xffBBD6EC),
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
                    price,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: Color(0xff64636A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rolls-Royce Cullinan',
                  style: Styles.titleSmall.copyWith(
                    color: const Color(0xff171820),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.dollarSign,
                      color: Colors.black,
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
          ),
        ],
      ),
    );
  }
}
