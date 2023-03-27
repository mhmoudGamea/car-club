import 'package:car_club/core/cache_helper.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/helper.dart';
import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';

import 'widgets/get_error_message.dart';
import 'widgets/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  static const rn = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is SuccessEmailAndPasswordSigningState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).pushReplacement(TabsView.rn);
            debugPrint("navigation is done");

            Helper.showCustomToast(
                context: context,
                icon: Icons.check_circle,
                bgColor: Colors.greenAccent,
                msg: 'login successful ,enjoy');

            if (LoginCubit.get(context).remember) {
              CacheHelper.saveData(
                  'remember', LoginCubit.get(context).remember);
            }
          } else if (state is SuccessGoogleSigningState) {
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
            if (LoginCubit.get(context).remember) {
              CacheHelper.saveData(
                  'remember', LoginCubit.get(context).remember);
            }
          } else if (state is SuccessFacebookSigningState) {
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
            if (LoginCubit.get(context).remember) {
              CacheHelper.saveData(
                  'remember', LoginCubit.get(context).remember);
            }
          } else if (state is SuccessAppleSigningState) {
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
            if (LoginCubit.get(context).remember) {
              CacheHelper.saveData(
                  'remember', LoginCubit.get(context).remember);
            }
          } else if (state is ErrorEmailAndPasswordSigningState ||
              state is ErrorGoogleSigningState ||
              state is ErrorFacebookSigningState ||
              state is ErrorAppleSigningState) {
            authErrorHandle(context: context, state: state);
          }
        },
        child: const LoginViewBody());
  }
}
