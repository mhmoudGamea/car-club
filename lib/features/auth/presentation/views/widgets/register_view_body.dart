import 'package:car_club/features/auth/presentation/views/login_view.dart';
import 'package:car_club/features/auth/presentation/views/widgets/flutter_toast.dart';
import 'package:car_club/features/auth/presentation/views/widgets/or_sign_in_with_text.dart';
import 'package:car_club/features/auth/presentation/views/widgets/social_media_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../../data/auth_services/register/register_cubit/register_cubit.dart';
import 'auth_button.dart';
import 'text_field_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
    required this.cubit,
  });
  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Form(
          key: cubit.registerFormKey,
          child: Column(
            children: [
              DefaultTextField(
                type: TextInputType.name,
                hintText: 'Name',
                onChanged: (value) {},
                controller: cubit.nameController,
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultTextField(
                hintText: 'E-mail',
                type: TextInputType.emailAddress,
                onChanged: (value) {},
                controller: cubit.emailController,
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultTextField(
                hintText: 'password',
                type: TextInputType.visiblePassword,
                onChanged: (value) {},
                obscureText: cubit.visibility,
                suffix: InkWell(
                  child: Icon(cubit.visibility
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () => cubit.changePasswordVisibility(),
                ),
                controller: cubit.passwordController,
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultTextField(
                hintText: 'Confirm Password',
                type: TextInputType.visiblePassword,
                onChanged: (value) {},
                controller: cubit.confirmPasswordController,
                obscureText: cubit.visibility,
                suffix: InkWell(
                  child: Icon(cubit.visibility
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () => cubit.changePasswordVisibility(),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              defaultButton(
                  buttonName: 'Sign Up',
                  onTap: () {
                    if (cubit.passwordController.text !=
                        cubit.confirmPasswordController.text) {
                      return defaultFlutterToast(
                          message:
                              'the confirm password not match the password',
                          state: ToastState.error);
                    }
                    if (cubit.registerFormKey.currentState!.validate()) {
                      RegisterCubit.get(context).userRegister(
                          name: cubit.nameController.text,
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                          confirmPassword:
                              cubit.confirmPasswordController.text);
                    }
                  }),
              const SizedBox(height: 95),
              const OrSignInText(),
              const SizedBox(height: 18),
              const SocialMediaSignIn(),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: Styles.authCustomTitle,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                  value: loginCubit,
                                  child: const LoginScreen())),
                        );
                      },
                      child: const Text(
                        'Sign In',
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
    );
  }
}
