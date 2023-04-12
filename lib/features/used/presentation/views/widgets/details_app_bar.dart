import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../post/data/models/post_model.dart';

class DetailsAppBar extends StatelessWidget {
  final PostModel model;
  const DetailsAppBar({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        'Details',
        style: Styles.title16.copyWith(color: blackColor, fontSize: 16),
      ),
      backgroundColor: whiteColor,
      elevation: 1,
    );
  }
}
