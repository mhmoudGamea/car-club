import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'cover_and_profile.dart';
import 'information_box.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: const [
          CoverAndProfile(),
          SizedBox(height: 10),
          Text(
            'Alexandra Dedario',
            style: Styles.title16,
          ),
          Text(
            'Write ur bio...',
            style: Styles.title13,
          ),
          InformationBox(),
        ],
      ),
    );
  }
}
