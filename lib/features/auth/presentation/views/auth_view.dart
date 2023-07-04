import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_club/core/constants.dart';

import '../../../../core/cache_helper.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/tabs_view.dart';
import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';
import 'widgets/auth_view_body.dart';
import 'widgets/get_error_message.dart';

class AuthenticationView extends StatelessWidget {
  static const rn = '/AuthenticationView';
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is SuccessGoogleSigningState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).pushReplacement(TabsView.rn);
            Helper.showCustomToast(
                context: context,
                icon: Icons.check_circle,
                bgColor: Colors.greenAccent,
                msg: 'login successful ,enjoy');
          }
          else if (state is SuccessFacebookSigningState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).pushReplacement(TabsView.rn);
            Helper.showCustomToast(
                context: context,
                icon: Icons.check_circle,
                bgColor: Colors.greenAccent,
                msg: 'login successful ,enjoy');
          }
          else if (state is SuccessAppleSigningState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).pushReplacement(TabsView.rn);
            Helper.showCustomToast(
                context: context,
                icon: Icons.check_circle,
                bgColor: Colors.greenAccent,
                msg: 'login successful ,enjoy');
          }
          else if (state is ErrorGoogleSigningState || state is ErrorFacebookSigningState || state is ErrorAppleSigningState) {
            authErrorHandle(context: context, state: state);
          }
        },
        child: const AuthenticationViewBody(),
      ),
    );
  }
}
