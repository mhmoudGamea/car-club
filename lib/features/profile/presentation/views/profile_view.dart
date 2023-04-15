
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
          leading: IconButton(

            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(

                     builder: (BuildContext context)=>  const HomeView()
                ),
              );
            },
            icon: const Icon(FontAwesomeIcons.chevronLeft,
                size: 20.0,
                color: blackColor,)



          ),
          title: const Center(
              child: Text(
            "MyProfile",
            style: Styles.appBarTitleMedium,
          )),
          actions: [
            IconButton(
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
                color: Colors.pink,
                size: 20,)

            )
          ],
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
