import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UsedViewBody extends StatelessWidget {
  const UsedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'used',
        style: Styles.title14,
      ),
    );
  }
}
