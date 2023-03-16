import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class InformationBox extends StatelessWidget {
  const InformationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('20',
                  style: Styles.title13.copyWith(color: textButtonColor)),
              Text('Posts',
                  style: Styles.title14.copyWith(color: textButtonColor)),
            ],
          ),
          Column(
            children: [
              Text('100',
                  style: Styles.title13.copyWith(color: textButtonColor)),
              Text('Photo',
                  style: Styles.title14.copyWith(color: textButtonColor)),
            ],
          ),
          Column(
            children: [
              Text('10k',
                  style: Styles.title13.copyWith(color: textButtonColor)),
              Text('Followers',
                  style: Styles.title14.copyWith(color: textButtonColor)),
            ],
          ),
          Column(
            children: [
              Text('50',
                  style: Styles.title13.copyWith(color: textButtonColor)),
              Text('Followings',
                  style: Styles.title14.copyWith(color: textButtonColor)),
            ],
          ),
        ],
      ),
    );
  }
}
