import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import './widgets/home_view_details_body.dart';

class HomeViewDetails extends StatelessWidget {
  static const rn = '/homeViewDetails';
  const HomeViewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.normalAppBar(
        context: context,
        title: 'Car Details',
        backgroundColor: const Color(0xffDEE1E7),
        color: Colors.black,
      ),
      body: const HomeViewDetailsBody(),
    );
  }
}
