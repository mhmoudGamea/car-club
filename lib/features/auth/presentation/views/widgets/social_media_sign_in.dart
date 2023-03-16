import 'package:car_club/features/auth/data/auth_services/login/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../data/auth_services/login/login_cubit/login_cubit.dart';
import 'auth_icons_shape.dart';

class SocialMediaSignIn extends StatelessWidget {
  const SocialMediaSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconShape(
              image: facebook,
              onTap: () {
                LoginCubit.get(context).loginWithFacebook();
              }),
          const SizedBox(width: 23),
          iconShape(
              image: google,
              onTap: () {
                // LoginCubit.get(context).loginWithGoogle();
              }),
          const SizedBox(width: 23),
          iconShape(
              image: apple,
              onTap: () {
                LoginCubit.get(context).loginWithApple();
              }),
        ],
      ),
    );
  }
}
