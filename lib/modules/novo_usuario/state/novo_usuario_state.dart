abstract class NovoUsuarioState {}

class InitialNovoUsuarioState extends NovoUsuarioState {}

class SuccessNovoUsuarioState extends NovoUsuarioState {
  final String message;

  SuccessNovoUsuarioState(this.message);
}

class LoadingNovoUsuarioState extends NovoUsuarioState {}

class ErrorNovoUsuarioState extends NovoUsuarioState {
  final String message;

  ErrorNovoUsuarioState(this.message);
}