import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class DetailsAppBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onpress;
  const DetailsAppBar(
      {Key? key, required this.text, required this.icon, required this.onpress})
      : super(key: key);

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
        text,
        style: Styles.title16.copyWith(color: blackColor, fontSize: 16),
      ),
      backgroundColor: whiteColor,
      elevation: 1,
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: 14),
          constraints: const BoxConstraints(),
          onPressed: onpress,
          icon: const Icon(
            Icons.search_rounded,
            size: 25,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
