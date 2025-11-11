abstract class PerfilState {}

class InitialPerfilState extends PerfilState {}

class SuccessPerfilState extends PerfilState {
  final String message;

  SuccessPerfilState(this.message);
}

class LoadingPerfilState extends PerfilState {}

class ErrorPerfilState extends PerfilState {
  final String message;

  ErrorPerfilState(this.message);
}