import 'package:car_club/core/cache_helper.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/features/auth/presentation/views/widgets/flutter_toast.dart';
import 'package:car_club/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';
import 'widgets/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessEmailAndPasswordSigningState)
        {
          CacheHelper.saveData('uId', state.uid);
          uId = CacheHelper.getData('uId');
          debugPrint("uId : $uId");
          CacheHelper.saveData('email', state.email);
          email = CacheHelper.getData('email');
          debugPrint("email : $email");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
          defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
          if(LoginCubit.get(context).remember)
          {
            CacheHelper.saveData('remember', LoginCubit.get(context).remember);
          }
        } else if (state is SuccessGoogleSigningState)
        {
          CacheHelper.saveData('uId', state.uid);
          uId = CacheHelper.getData('uId');
          debugPrint("uId : $uId");
          CacheHelper.saveData('email', state.email);
          email = CacheHelper.getData('email');
          debugPrint("email : $email");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
          defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
        } else if (state is SuccessFacebookSigningState)
        {
          CacheHelper.saveData('uId', state.uid);
          uId = CacheHelper.getData('uId');
          debugPrint("uId : $uId");
          CacheHelper.saveData('email', state.email);
          email = CacheHelper.getData('email');
          debugPrint("email : $email");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
          defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
        } else if (state is SuccessAppleSigningState)
        {
          CacheHelper.saveData('uId', state.uid);
          uId = CacheHelper.getData('uId');
          debugPrint("uId : $uId");
          CacheHelper.saveData('email', state.email);
          email = CacheHelper.getData('email');
          debugPrint("email : $email");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
          defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
        } else if (state is ErrorEmailAndPasswordSigningState)
        {
          showDialog(context: context, builder: (context) => AlertDialog(
            title:const Text('Error'),
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
          defaultFlutterToast(message: 'login error', state: ToastState.ERROR);
        } else if (state is ErrorGoogleSigningState)
        {
          defaultFlutterToast(message: 'login error', state: ToastState.ERROR);
        } else if (state is ErrorFacebookSigningState)
        {
          defaultFlutterToast(message: 'login error', state: ToastState.ERROR);
        } else if (state is ErrorAppleSigningState)
        {
          defaultFlutterToast(message: 'login error', state: ToastState.ERROR);
        }
      },
      child: const LoginViewBody()

    );
  }
}
