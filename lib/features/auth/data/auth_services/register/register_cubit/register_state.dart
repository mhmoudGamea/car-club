part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoadingEmailAndPasswordRegisterState extends RegisterState {}

class SuccessEmailAndPasswordRegisterState extends RegisterState {
  late final dynamic uid;
  late final dynamic email;
  SuccessEmailAndPasswordRegisterState(this.uid, this.email);
}

class ErrorEmailAndPasswordRegisterState extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  late final dynamic error;
  RegisterFailure(this.error);
}

class CreateUserSuccess extends RegisterState {
  late final dynamic uid;
  late final dynamic email;
  CreateUserSuccess(this.uid, this.email);
}

class CreateUserError extends RegisterState {
  final String error;
  CreateUserError(this.error);
}

class LoadingGoogleRegisterState extends RegisterState {}

class SuccessGoogleRegisterState extends RegisterState {
  late final dynamic uid;
  late final dynamic email;
  SuccessGoogleRegisterState(this.uid, this.email);
}

class ErrorGoogleRegisterState extends RegisterState {}

class LoadingFacebookRegisterState extends RegisterState {}

class SuccessFacebookRegisterState extends RegisterState {
  late final dynamic uid;
  late final dynamic email;
  SuccessFacebookRegisterState(this.uid, this.email);
}

class ErrorFacebookRegisterState extends RegisterState {}

class LoadingAppleRegisterState extends RegisterState {}

class SuccessAppleRegisterState extends RegisterState {
  late final dynamic uid;
  late final dynamic email;
  SuccessAppleRegisterState(this.uid, this.email);
}

class ErrorAppleRegisterState extends RegisterState {}

class ChangePasswordVisibility extends RegisterState {}
