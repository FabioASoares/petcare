abstract class AgendarState {}

class InitialAgendarState extends AgendarState {}

class SuccessAgendarState extends AgendarState {
  final String message;

  SuccessAgendarState(this.message);
}

class LoadingAgendarState extends AgendarState {}

class ErrorAgendarState extends AgendarState {
  final String message;

  ErrorAgendarState(this.message);
}