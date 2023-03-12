import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:car_club/features/auth/presentation/views/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache_helper.dart';
import '../../data/auth_services/register/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const rn = '/RegisterScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(message: 'register Success', state: ToastState.SUCCESS);
          }else if (state is SuccessEmailAndPasswordRegisterState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(message: 'register Success', state: ToastState.SUCCESS);
          } else if (state is SuccessGoogleRegisterState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(message: 'register Success', state: ToastState.SUCCESS);
          } else if (state is SuccessFacebookRegisterState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(
                message: 'register Success', state: ToastState.SUCCESS);
          } else if (state is SuccessAppleRegisterState) {
            CacheHelper.saveData('uId', state.uid);
            uId = CacheHelper.getData('uId');
            debugPrint("uId : $uId");
            CacheHelper.saveData('email', state.email);
            email = CacheHelper.getData('email');
            debugPrint("email : $email");
            GoRouter.of(context).push(TabsView.rn);
            debugPrint("navigation is done");
            defaultFlutterToast(
                message: 'register Success', state: ToastState.SUCCESS);
          } else if (state is ErrorEmailAndPasswordRegisterState) {
            defaultFlutterToast(
                message: 'register error', state: ToastState.ERROR);
          } else if (state is ErrorGoogleRegisterState) {
            defaultFlutterToast(
                message: 'register error', state: ToastState.ERROR);
          } else if (state is ErrorFacebookRegisterState) {
            defaultFlutterToast(
                message: 'register error', state: ToastState.ERROR);
          } else if (state is ErrorAppleRegisterState) {
            defaultFlutterToast(
                message: 'register error', state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create Account'),
              titleTextStyle: const TextStyle(
                  color: secondaryLoginColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              backgroundColor: primaryDark,
            ),
            body: Center(child: RegisterViewBody(cubit: cubit)),
          );
        },
      ),
    );
  }
}
