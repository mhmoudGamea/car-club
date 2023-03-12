
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/widgets/tabs_view.dart';

import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';
import 'widgets/auth_view_body.dart';
import 'widgets/flutter_toast.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);
  static const rn = '/AuthenticationView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit,LoginStates>(
        listener: (context, state) {
          if (state is SuccessGoogleSigningState)
          {
            CacheHelper.saveData('uId', state.uid);
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
          } else if (state is SuccessFacebookSigningState)
          {
            CacheHelper.saveData('uId', state.uid);
            GoRouter.of(context).push(TabsView.rn);
            defaultFlutterToast(message: 'login Success', state: ToastState.SUCCESS);
          } else if (state is SuccessAppleSigningState)
          {
            CacheHelper.saveData('uId', state.uid);
            GoRouter.of(context).push(TabsView.rn);
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

