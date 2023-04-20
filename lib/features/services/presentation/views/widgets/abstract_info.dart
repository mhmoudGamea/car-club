import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
class AbstractInformation extends StatelessWidget {
  const AbstractInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: greyColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.clock,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '40 minutes',
                        style: Styles.title12
                            .copyWith(color: Colors.black54,fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Delivery is available
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: greyColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.motorcycle,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        ' Delivery is available',
                        style: Styles.title12
                            .copyWith(color: Colors.black54,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // Accepts discounts
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: greyColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.percent,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Accepts discounts',
                        style: Styles.title12
                            .copyWith(color: Colors.black54,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Open
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: greyColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.unlock,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Open',
                        style: Styles.title12
                            .copyWith(color: Colors.green,fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              //Closed
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: greyColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.lock,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Closed',
                        style: Styles.title12
                            .copyWith(color: Colors.red,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // Accepts discounts
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: greyColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.creditCard,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Accepts credit cards',
                        style: Styles.title12
                            .copyWith(color: Colors.black54,fontWeight: FontWeight.w500),

                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}