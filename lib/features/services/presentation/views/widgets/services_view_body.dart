import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Services',
        style: Styles.title13,
      ),
    );
  }
}
