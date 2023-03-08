part of 'register_cubit.dart';

abstract class RegisterState {}
class LoadingEmailAndPasswordRegisterState extends RegisterState{}
class SuccessEmailAndPasswordRegisterState extends RegisterState{
  late final dynamic uid;
  SuccessEmailAndPasswordRegisterState(this.uid);
}
class ErrorEmailAndPasswordRegisterState extends RegisterState{}
class RegisterInitial extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterFailure extends RegisterState {
  String errMessage;
  RegisterFailure({required this.errMessage});
}
class CreateUserSuccess extends RegisterState {
}
class CreateUserError extends RegisterState {
  final String error;
  CreateUserError(this.error);
}

class LoadingGoogleRegisterState extends RegisterState{}
class SuccessGoogleRegisterState extends RegisterState{
  late final dynamic uid;
  SuccessGoogleRegisterState(this.uid);
}
class ErrorGoogleRegisterState extends RegisterState{}

class LoadingFacebookRegisterState extends RegisterState{}
class SuccessFacebookRegisterState extends RegisterState{
  late final dynamic uid;
  SuccessFacebookRegisterState(this.uid);

}
class ErrorFacebookRegisterState extends RegisterState{}


class LoadingAppleRegisterState extends RegisterState{}
class SuccessAppleRegisterState extends RegisterState{
  late final dynamic uid;
  SuccessAppleRegisterState(this.uid);

}
class ErrorAppleRegisterState extends RegisterState{}
class ChangePasswordVisibility extends RegisterState{}