import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/helper.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const rn = '/profileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.normalAppBar(
          context: context,
          title: 'Profile',
          backgroundColor: whiteColor,
          color: textButtonColor),
      body: const SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
