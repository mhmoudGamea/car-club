import 'package:car_club/features/auth/presentation/views/widgets/or_sign_in_with_text.dart';
import 'package:car_club/features/auth/presentation/views/widgets/social_media_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../login_view.dart';
import '../register_view.dart';
import 'auth_button.dart';
class AuthenticationViewBody extends StatelessWidget {
  const AuthenticationViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const Image(
                    image: AssetImage(logo),
                    width: 166,
                    height: 166,
                  ),
                  const SizedBox(
                    height: 83,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return BlocProvider.value(
                                  value: loginCubit,
                                  child: const LoginScreen());
                            },
                          ));
                        },
                        child: const Text(
                          'Sign in',
                          style: textButtonStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  defaultButton(
                    buttonName: 'Create Account',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider.value(
                              value: loginCubit,
                              child: const RegisterScreen());
                        },
                      ));
                    },
                  ),
                  const SizedBox(height: 107),
                  const OrSignInText(),
                  const SizedBox(height: 18),
                  const SocialMediaSignIn()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                TextButton(
                  child:const Text('terms of use',style: TextStyle(color: Colors.white)),
                  onPressed: () {

                  },
                ),
                const SizedBox(width: 44),
                TextButton(
                  child:const Text('privacy policy',style: TextStyle(color: Colors.white)),
                  onPressed: () {

                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
