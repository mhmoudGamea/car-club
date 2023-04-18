import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import 'owner_address.dart';

class UsedCarMapBox extends StatelessWidget {
  final String ownerAddress;
  const UsedCarMapBox({Key? key, required this.ownerAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: greyColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: Styles.title15
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const OwnerAddress(),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.location_on_rounded,
                  size: 20, color: blackColor),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  ownerAddress,
                  style: Styles.title14.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
