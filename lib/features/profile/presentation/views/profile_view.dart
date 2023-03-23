import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const rn = '/profileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(6),
            width: 45,
            decoration: BoxDecoration(

                border: Border.all(color: greyColor, width: 1),
                color: whiteColor,
                borderRadius: BorderRadius.circular(18.0)),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25.0,
              color: greyColor,
            ),
          ),

          title: const Center(
              child: Text(
            "MyProfile",
            style: Styles.appBarTitleMedium,
          )),
          actions: [
            Container(
              margin: const EdgeInsets.all(6),
                width: 45,
              //  height: 10,
                decoration: BoxDecoration(

                    border: Border.all(color: greyColor, width: 1),
                    color: const Color(0xfff4d4d4),
                    borderRadius: BorderRadius.circular(18.0)),
                child: const Icon(FontAwesomeIcons.rocketchat,color: babyBlue,
                size: 25,))
          ],
        ),
        body: const SafeArea(
          child: ProfileViewBody(),
        ),
      ),
    );
  }
}
