import 'package:car_club/core/cache_helper.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/auth/presentation/views/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';

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
            GoRouter.of(context).push(TabsView.rn);
            debugPrint("navigation is done");
            defaultFlutterToast(
                message: 'login Success', state: ToastState.success);
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
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(
                message: 'login Success', state: ToastState.success);
          } else if (state is SuccessFacebookSigningState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(
                message: 'login Success', state: ToastState.success);
          } else if (state is SuccessAppleSigningState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(
                message: 'login Success', state: ToastState.success);
          } else if (state is ErrorEmailAndPasswordSigningState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      titleTextStyle: const TextStyle(
                        color: secondaryLoginColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      content: Text(state.error.toString()),
                      contentTextStyle: const TextStyle(
                        color: secondaryLoginColor,
                      ),
                      backgroundColor: primaryDark,
                    ));
            defaultFlutterToast(
                message: 'login error', state: ToastState.error);
          } else if (state is ErrorGoogleSigningState) {
            defaultFlutterToast(
                message: 'login error', state: ToastState.error);
          } else if (state is ErrorFacebookSigningState) {
            defaultFlutterToast(
                message: 'login error', state: ToastState.error);
          } else if (state is ErrorAppleSigningState) {
            defaultFlutterToast(
                message: 'login error', state: ToastState.error);
          }
        },
        child: const LoginViewBody());
  }
}
