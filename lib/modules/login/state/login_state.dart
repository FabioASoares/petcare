abstract class LoginState {}

class InitialLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final String message;

  SuccessLoginState(this.message);
}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState(this.message);
}