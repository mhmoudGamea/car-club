abstract class LoginStates {}

class InitialState extends LoginStates {}

class LoadingEmailAndPasswordSigningState extends LoginStates {}
class SuccessEmailAndPasswordSigningState extends LoginStates {
  late final dynamic uid;
  late final dynamic email;
  SuccessEmailAndPasswordSigningState(this.uid, this.email);
}
class ErrorEmailAndPasswordSigningState extends LoginStates {
  late final dynamic error;
  ErrorEmailAndPasswordSigningState(this.error);
}

class LoadingGoogleSigningState extends LoginStates {}
class SuccessGoogleSigningState extends LoginStates {
  late final dynamic uid;
  late final dynamic email;
  SuccessGoogleSigningState(this.uid, this.email);
}
class ErrorGoogleSigningState extends LoginStates {
  late final dynamic error;
  ErrorGoogleSigningState(this.error);
}

class LoadingFacebookSigningState extends LoginStates {}
class SuccessFacebookSigningState extends LoginStates {
  late final dynamic uid;
  late final dynamic email;
  SuccessFacebookSigningState(this.uid, this.email);
}
class ErrorFacebookSigningState extends LoginStates {
  late final dynamic error;
  ErrorFacebookSigningState(this.error);
}

class LoadingAppleSigningState extends LoginStates {}
class SuccessAppleSigningState extends LoginStates {
  late final dynamic uid;
  late final dynamic email;
  SuccessAppleSigningState(this.uid, this.email);
}
class ErrorAppleSigningState extends LoginStates {
  late final dynamic error;
  ErrorAppleSigningState(this.error);
}

class SuccessRememberMeState extends LoginStates {}
class ChangePasswordVisibility extends LoginStates {}

class LoadingResetPasswordState extends LoginStates {}
class SuccessResetPasswordState extends LoginStates {}
class ErrorResetPasswordState extends LoginStates {}
