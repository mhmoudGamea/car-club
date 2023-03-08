
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache_helper.dart';
import '../../../home/presentation/views/home_view.dart';

import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';
import 'widgets/auth_view_body.dart';
import 'widgets/flutter_toast.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit,LoginStates>(
        listener: (context, state) {
          if (state is SuccessGoogleSigningState)
          {
            CacheHelper.saveData('uId', state.uid);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
                    (route) => false);
            defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
          } else if (state is SuccessFacebookSigningState)
          {
            CacheHelper.saveData('uId', state.uid);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
                    (route) => false);
            defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
          } else if (state is SuccessAppleSigningState)
          {
            CacheHelper.saveData('uId', state.uid);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
                    (route) => false);
            defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
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
        child:const AuthenticationViewBody(),
      ),
    );
  }
}

