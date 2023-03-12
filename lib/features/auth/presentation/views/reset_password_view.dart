import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../data/auth_services/login/login_cubit/login_states.dart';
import 'widgets/reset_password_body.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
  static const rn = '/ResetPasswordPage';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) => ResetPasswordBody());
  }
}
