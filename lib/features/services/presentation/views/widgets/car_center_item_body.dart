import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class ItemViewBody extends StatelessWidget {
  const ItemViewBody({Key? key, required this.carCenterModel }) : super(key: key);
  static const rn = '/ItemViewBody';
  final CarCenterModel carCenterModel;
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
            children: const [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(image: AssetImage(ford),
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
                      'Car name',
                      style: Styles.titleSmall.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
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
                          ' hp',
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
                          '15 km/h',
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
                          '50',
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
