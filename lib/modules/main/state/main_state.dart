abstract class MainState {}

class InitialMainState extends MainState {}

class SuccessMainState extends MainState {
  final String message;

  SuccessMainState(this.message);
}

class LoadingMainState extends MainState {}

class ErrorMainState extends MainState {
  final String message;

  ErrorMainState(this.message);
}
