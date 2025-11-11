abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final String message;

  SuccessHomeState(this.message);
}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);
}