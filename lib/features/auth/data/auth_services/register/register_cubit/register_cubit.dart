import 'package:car_club/features/auth/data/auth_services/register/register_cubit/register_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/view_models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
          name: name,
          uId:value.user!.uid,
          email: email,);

    }).catchError((error) {
      emit(RegisterFailure(errMessage: error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String uId,
    required String email,
  }) {
    UserModel model = UserModel(uId: uId, name: name, email: email);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap()).then((value) {
          debugPrint(passwordController.text);
          emit(CreateUserSuccess(uId,email));
    }).catchError((error){
      debugPrint(error.toString());
      emit(CreateUserError(error.toString()));
    });
  }

  void loginWithEmailAndPassword({required String email, required String password}) {
    emit(LoadingGoogleRegisterState());
    createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      debugPrint(value.user!.uid);
      emit(SuccessEmailAndPasswordRegisterState(value.user!.uid,value.user!.email));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorEmailAndPasswordRegisterState());
    });
  }

  void loginWithFacebook() {
    emit(LoadingFacebookRegisterState());
    signInWithFacebook().then((value) {
      debugPrint(value.user!.uid);
      emit(SuccessFacebookRegisterState(value.user!.uid,value.user!.email));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorFacebookRegisterState());
    });
  }

  void loginWithApple() {
    emit(LoadingAppleRegisterState());
    signInWithApple().then((value) {
      debugPrint(value.user!.uid);
      emit(SuccessAppleRegisterState(value.user!.uid,value.user!.email));
    }).catchError((error) {
      debugPrint('error is :: ${error.toString()}');
      emit(ErrorAppleRegisterState());
    });
  }

  bool visibility = true;
  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangePasswordVisibility());
  }
}
