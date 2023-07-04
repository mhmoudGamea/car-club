import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../../../../../../core/utils/helper.dart';
import 'login_services.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool remember = false;
  Future<void> rememberMe(bool value) async {
    remember = value;
    emit(SuccessRememberMeState());
  }

  Future<void> resetPassword(String email, context) async {
    emit(LoadingResetPasswordState());
    await sendPasswordResetEmail(email).then((value) {
      Helper.showCustomToast(
          context: context,
          icon: Icons.check_circle,
          bgColor: Colors.greenAccent,
          msg: 'Done reset password ');
      emit(SuccessResetPasswordState());
    }).catchError((error) {
      Helper.showCustomToast(
          context: context,
          icon: Icons.check_circle,
          bgColor: Colors.greenAccent,
          msg: 'try again');
      emit(ErrorResetPasswordState());
    });
  }

  void loginWithEmailAndPassword({required String email, required String password}) {
    emit(LoadingEmailAndPasswordSigningState());
    signInWithEmailAndPassword(email: email, password: password).then((value) {
      debugPrint(value.user!.uid);
      debugPrint(value.user!.email);
      emit(SuccessEmailAndPasswordSigningState(
          value.user!.uid, value.user!.email));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorEmailAndPasswordSigningState(error));
    });
  }

  // void loginWithGoogle() {
  //   emit(LoadingGoogleSigningState());
  //   signInWithGoogle().then((value) {
  //     debugPrint(value.user!.uid);
  // debugPrint(value.user!.email);
  //     emit(SuccessGoogleSigningState(value.user!.uid,value.user!.email));
  //   }).catchError((error) {
  //     debugPrint('error is :: ${error.toString()}');
  //     emit(ErrorGoogleSigningState(error));
  //   });
  // }
  FacebookLogin facebookLogin = FacebookLogin();

  Future<void> loginWithFacebook() async {
    emit(LoadingFacebookSigningState());
    FacebookLoginResult result = await facebookLogin.logIn(customPermissions: ['email']);
    final token = result.accessToken!.token;
    if(result.status == FacebookLoginStatus.success){
      final faceCredential = FacebookAuthProvider.credential(token);
      await FirebaseAuth.instance.signInWithCredential(faceCredential).then((value) {
        emit(SuccessFacebookSigningState(value.user!.uid, value.user!.email));
      }).catchError((error){
          debugPrint('error is :: ${error.toString()}');
          emit(ErrorFacebookSigningState(error));
      });

    }
    //
    // signInWithFacebook().then((value) {
    //   debugPrint(value.user!.uid);
    //   value.
    //   debugPrint(value.user!.email);
    // }).catchError((error) {
    //   debugPrint('error is :: ${error.toString()}');
    //   emit(ErrorFacebookSigningState(error));
    // });
  }

  void loginWithApple() {
    emit(LoadingAppleSigningState());
    signInWithApple().then((value) {
      debugPrint(value.user!.uid);
      debugPrint(value.user!.email);
      emit(SuccessAppleSigningState(value.user!.uid, value.user!.email));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorAppleSigningState(error));
    });
  }

  bool visibility = true;
  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangePasswordVisibility());
  }
}
