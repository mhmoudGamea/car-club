
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants.dart';
import '../../../auth/presentation/views/login_view.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const rn = '/profileView';
   ProfileView({Key? key}) : super(key: key);
 final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(6),
            width: 45,
            decoration: BoxDecoration(
                border: Border.all(color: greyColor, width: 1),
                color: whiteColor,
                borderRadius: BorderRadius.circular(18.0)),
            child: IconButton(

              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(

                       builder: (BuildContext context)=>  const HomeView()
                  ),
                );
              },
              icon: const Icon(FontAwesomeIcons.chevronLeft,
                  size: 25.0,
                  color: greyColor,)



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
                child: IconButton(
                  onPressed: () {
               _auth.signOut();
               Navigator.pop(
                 context,
                 MaterialPageRoute(

                     builder: (BuildContext context)=>  const LoginScreen()
                 ),
               );
                  },
                  icon: const Icon(FontAwesomeIcons.rightFromBracket,
                    color: babyBlue,
                    size: 25,)

                ))
          ],
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
