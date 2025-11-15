abstract class VacinacaoState {}

class InitialVacinacaoState extends VacinacaoState {}

class SuccessVacinacaoState extends VacinacaoState {
  final String message;

  SuccessVacinacaoState(this.message);
}

class LoadingVacinacaoState extends VacinacaoState {}

class ErrorVacinacaoState extends VacinacaoState {
  final String message;

  ErrorVacinacaoState(this.message);
}