import 'package:car_club/features/auth/presentation/views/login_view.dart';
import 'package:car_club/features/auth/presentation/views/widgets/or_sign_in_with_text.dart';
import 'package:car_club/features/auth/presentation/views/widgets/social_media_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/auth_services/login/login_cubit/login_cubit.dart';
import '../../../data/auth_services/register/register_cubit/register_cubit.dart';
import 'auth_button.dart';
import 'text_field_widget.dart';

class RegisterViewBody extends StatelessWidget {
   RegisterViewBody({
    super.key,
    required this.cubit,
  });
  final RegisterCubit cubit;
  FocusNode focusNode = FocusNode();
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
             // const SizedBox(
             //   height: 18,
             // ),
             /* DefaultTextField(
                hintText: 'phone',
                type: TextInputType.phone,
                onChanged: (value) {},
                controller: cubit.phoneController,

                suffix: const InkWell(
                  child: Icon(Icons.call_outlined),

                ),
              ),*/

              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: IntlPhoneField(

                  cursorColor: mintGreen,
                  focusNode: focusNode,
                  controller: cubit.phoneController,
                  decoration:  InputDecoration(

                    hintText: 'Phone Number',
                    contentPadding:
                    const EdgeInsets.only(top: 16, bottom: 16, left: 23),
                    hintStyle:TextStyle(color: Colors.black54,fontSize: 21),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: mintGreen),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: greyColor2,
                      ),
                    ),
                    filled: true,
                    fillColor: greyColor2,

                  ),
                  languageCode: "en",
                  onChanged: (phone) {
                  },
                  onCountryChanged: (country) {
                  },
                ),
              ),
              const SizedBox(
                height: 12,
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
              BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) => defaultButton(
                    buttonName: state is LoadingEmailAndPasswordRegisterState ?  const SizedBox(
                      height: 28,
                      width: 28,
                      child: CircularProgressIndicator(color: whiteColor,),
                    ): const Text("Sign Up",style: textButtonStyle),
                    onTap: () {
                      if (cubit.registerFormKey.currentState!.validate()) {
                        RegisterCubit.get(context).userRegister(
                          name: cubit.nameController.text,
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                          phone:  cubit.phoneController.text,
                        );
                      }
                    }),
              ),
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
