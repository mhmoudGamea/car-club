import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../auth_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });
  static const colorizeColors = [

    Color(0xff051937),
    Color(0xff33265b),
    Color(0xff6f2973),
    Color(0xffaf1f79),
    Color(0xffeb126b),

    //background-image: linear-gradient(to right top, #051937, #33265b, #6f2973, #af1f79, #eb126b);

  ];
  // static const colorizeTextStyle = TextStyle(
  //   //fontSize: 40.0,
  //   //fontFamily: ''
  //
  // );

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(


                decoration: BoxDecoration(
                  //color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(30),
                  //border: Border.all(color: Colors.cyan)
                ),
                child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_gv7Ovi.json',)


            ),

            SizedBox(
              width: 245.0,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    ' Sell or Buy',
                    textStyle:Styles.titleLargest,
                    colors: SplashViewBody.colorizeColors,
                  ),


                ],
                isRepeatingAnimation: true,
                onTap: () {
                  debugPrint("Tap Event");
                },
              ),
            ),

          ],
        ),
      ),);

  }

  void navigateToHome() {

    Future.delayed(
        const Duration(
          seconds: 9,
        ), () {
      GoRouter.of(context as BuildContext).push(AuthenticationView.rn);
      Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) {
        return const AuthenticationView();})
      );
    });
  }
}
