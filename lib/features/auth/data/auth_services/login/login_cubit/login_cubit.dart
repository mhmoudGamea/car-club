import 'package:car_club/features/auth/presentation/views/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_services.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool remember = false;
  Future<void> rememberMe(bool value)async
  {
    remember = value;
    emit(SuccessRememberMeState());
  }

  Future<void> resetPassword(String email) async {
    emit(LoadingResetPasswordState());
    await sendPasswordResetEmail(email).then((value) {
      defaultFlutterToast(message: 'Done', state: ToastState.SUCCESS);
      emit(SuccessResetPasswordState());
    }).catchError((error){
      defaultFlutterToast(message: 'try again', state: ToastState.ERROR);
      emit(ErrorResetPasswordState());
    });
  }


  void loginWithEmailAndPassword({
    required String email,
    required String password
  }){
    emit(LoadingEmailAndPasswordSigningState());
    signInWithEmailAndPassword(email: email, password: password).then((value) {
      debugPrint(value.user!.uid);
      emit(SuccessEmailAndPasswordSigningState(value.user!.uid));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorEmailAndPasswordSigningState(error));
    });
  }

  // void loginWithGoogle() {
  //   emit(LoadingGoogleSigningState());
  //   signInWithGoogle().then((value) {
  //     debugPrint(value.user!.uid);
  //     emit(SuccessGoogleSigningState(value.user!.uid));
  //   }).catchError((error) {
  //     debugPrint('error is :: ${error.toString()}');
  //     emit(ErrorGoogleSigningState(error));
  //   });
  // }

  void loginWithFacebook() {
    emit(LoadingFacebookSigningState());
    signInWithFacebook().then((value) {
      debugPrint(value.user!.uid);
      emit(SuccessFacebookSigningState(value.user!.uid));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorFacebookSigningState(error));
    });
  }

  void loginWithApple() {
    emit(LoadingAppleSigningState());
    signInWithApple().then((value) {
      debugPrint(value.user!.uid);
      emit(SuccessAppleSigningState(value.user!.uid));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorAppleSigningState(error));
    });
  }

  bool visibility = true;
  void changePasswordVisibility()
  {
    visibility = !visibility;
    emit(ChangePasswordVisibility());
  }
}
