import 'package:car_club/features/auth/data/auth_services/login/login_cubit/login_states.dart';
import 'package:car_club/features/auth/presentation/views/reset_password_view.dart';
import 'package:car_club/features/auth/presentation/views/widgets/text_field_widget.dart';
import 'package:car_club/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../register_view.dart';
import 'or_sign_in_with_text.dart';
import 'social_media_sign_in.dart';

class LoginViewBody extends StatelessWidget {
   const LoginViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                key: LoginCubit.get(context).loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(logo),
                      width: 107,
                      height: 166,
                    ),
                    const SizedBox(
                      height: 73,
                    ),
                    DefaultTextField(
                      type: TextInputType.emailAddress,
                      hintText: 'Email or username',
                      onChanged: (value) {},
                      controller: LoginCubit.get(context).emailController,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    BlocBuilder<LoginCubit,LoginStates>(
                      builder:(context, state) =>  DefaultTextField(
                        hintText: 'password',
                        type: TextInputType.visiblePassword,
                        onChanged: (value) {},
                        obscureText: LoginCubit.get(context).visibility,
                        suffix: InkWell(
                          child: Icon(
                            LoginCubit.get(context).visibility ? Icons.visibility : Icons.visibility_off,
                          ),
                          onTap: () => LoginCubit.get(context).changePasswordVisibility(),

                        ),
                        controller: LoginCubit.get(context).passwordController,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          BlocBuilder<LoginCubit,LoginStates>(
                            builder:(context,state)=> Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: Colors.cyanAccent)
                              ),
                                child: Checkbox(
                                activeColor: secondaryLoginColor,
                                value: LoginCubit.get(context).remember,
                                onChanged: (value) {
                                  debugPrint(value.toString());
                                  LoginCubit.get(context).rememberMe(value!);
                                },
                                checkColor: secondaryLoginColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Text(
                              'Remember me',
                              style: Styles.authCustomTitle.copyWith(fontSize: 13),
                            ),
                            onTap: () {},
                          ),
                          const Spacer(),
                          InkWell(
                            child: Text('Forget Password ?',
                                style: Styles.authCustomTitle.copyWith(fontSize: 13, color: secondaryLoginColor)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      BlocProvider.value(
                                          value: loginCubit,
                                          child: const ResetPasswordPage())));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 27),
                    defaultButton(
                        buttonName: 'Sign in',
                        onTap: () {
                          if (LoginCubit.get(context).loginFormKey.currentState!.validate()) {
                            LoginCubit.get(context).loginWithEmailAndPassword(
                                email: LoginCubit.get(context).emailController.text,
                                password: LoginCubit.get(context).passwordController.text);
                          }
                        }),
                    const SizedBox(height: 45),
                    const OrSignInText(),
                    const SizedBox(height: 18),
                    const SocialMediaSignIn(),
                    const SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don`t have an account?',
                          style: Styles.authCustomTitle,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder:(context) =>BlocProvider.value(
                                    value: loginCubit,
                                    child: const RegisterScreen())
                              ));
                            },
                            child: const Text(
                              'Sign UP',
                              style: TextStyle(
                                color: Color(0xff3EF1BD),
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  }
}


