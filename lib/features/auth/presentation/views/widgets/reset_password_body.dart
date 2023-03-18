import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/auth_services/login/login_cubit/login_cubit.dart';
import 'auth_button.dart';
import 'text_field_widget.dart';
class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDark,
        title: const Text('Reset Password',style: TextStyle(fontSize: 20,color: secondaryLoginColor),),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(logo),
                      width: 166,
                      height: 166,
                    ),
                    const SizedBox(
                      height: 73,
                    ),
                    DefaultTextField(
                      hintText: 'Email or username',
                      onChanged: (value) {},
                      controller: LoginCubit.get(context).emailController,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    defaultButton(
                        buttonName: 'Send',
                        onTap: () {
                          if(formKey.currentState!.validate())
                          {
                            LoginCubit.get(context).resetPassword(LoginCubit.get(context).emailController.text,context);
                          }
                        }
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
