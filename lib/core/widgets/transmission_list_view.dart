import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';

import 'filter_button.dart';

class TransmissionListView extends StatelessWidget {
  const TransmissionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        FilterButton(
          text: "Automatic",
          backgroundColor: mintGreen,
          textColor: whiteColor,
        ),
        FilterButton(
          text: "Tiptronic",
          backgroundColor: whiteColor,
          textColor: textButtonColor,
        ),
        FilterButton(
          text: "Manual",
          backgroundColor: whiteColor,
          textColor: textButtonColor,
        ),
      ],
    );
  }
}
