import 'package:flutter/material.dart';

import '../constants.dart';
import 'filter_button.dart';

class FuelListView extends StatelessWidget {
  const FuelListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        FilterButton(
          text: "Petrol",
          backgroundColor: whiteColor,
          textColor: textButtonColor,
        ),
        FilterButton(
          text: "Diesel",
          backgroundColor: mintGreen,
          textColor: whiteColor,
        ),
        FilterButton(
          text: "Hybrid",
          backgroundColor: whiteColor,
          textColor: textButtonColor,
        ),
      ],
    );
  }
}
