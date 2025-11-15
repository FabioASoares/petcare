abstract class InformacoesPetState {}

class InitialInformacoesPetState extends InformacoesPetState {}

class SuccessInformacoesPetState extends InformacoesPetState {
  final String message;

  SuccessInformacoesPetState(this.message);
}

class LoadingInformacoesPetState extends InformacoesPetState {}

class ErrorInformacoesPetState extends InformacoesPetState {
  final String message;

  ErrorInformacoesPetState(this.message);
}