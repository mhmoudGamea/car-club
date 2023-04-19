import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class NoUserFoundWidget extends StatelessWidget {
  const NoUserFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.userXmark,
                color: whiteColor,
                size: 19,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Sorry, no user found for this name',
                  style: Styles.title14.copyWith(color: whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
