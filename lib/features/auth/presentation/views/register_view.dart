import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/utils/helper.dart';
import '../../data/auth_services/register/register_cubit/register_cubit.dart';
import 'widgets/get_error_message.dart';

class RegisterScreen extends StatelessWidget {
  static const rn = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

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
            GoRouter.of(context).pushReplacement(TabsView.rn);
            Helper.showCustomToast(
                context: context,
                icon: Icons.check_circle,
                bgColor: Colors.greenAccent,
                msg: 'register successful ,enjoy');
          } else if (state is SuccessEmailAndPasswordRegisterState) {
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
                msg: 'register successful ,enjoy');
          } else if (state is SuccessGoogleRegisterState) {
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
                msg: 'register successful ,enjoy');
          } else if (state is SuccessFacebookRegisterState) {
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
                msg: 'register successful ,enjoy');
          } else if (state is SuccessAppleRegisterState) {
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
                msg: 'register successful ,enjoy');
          } else if (state is ErrorEmailAndPasswordRegisterState ||
              // state is ErrorGoogleRegisterState ||
              // state is ErrorFacebookRegisterState ||
              // state is ErrorAppleRegisterState ||
              state is RegisterFailure
          )
          {
            print("Error :: ${state.toString()}");
            authErrorHandle(context: context, state: state);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create Account'),
              elevation: 2,
              titleTextStyle: const TextStyle(
                color: mintGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: whiteColor,
            ),
            body: Center(child: RegisterViewBody(cubit: cubit)),
          );
        },
      ),
    );
  }
}
