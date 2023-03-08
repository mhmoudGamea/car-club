import 'package:car_club/core/widgets/expanded_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/car_box_preview_details.dart';
import '../../../../../core/widgets/horizontal_option_box_details.dart';
import '../../../../../core/widgets/vertical_option_box_details.dart';

class HomeViewDetailsBody extends StatelessWidget {
  const HomeViewDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CarBoxPreviewDetails(),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  HorizontalOptionBoxDetails(),
                  SizedBox(height: 30),
                  VerticalOptionBoxDetails(),
                  SizedBox(height: 30),
                  ExpandedWidget(
                      description:
                          'The 2022 Porsche Macan is a compact SUV with sports car character. For 2022, the Porsche Macan features a revised front and rear fascia, new rear diffuser, and newly designed side blades. There are also seven new wheel designs to choose from. For performance, the standard 2.0-liter four-cylinder engine has received a 13-horsepower increase to 261-hp,'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
