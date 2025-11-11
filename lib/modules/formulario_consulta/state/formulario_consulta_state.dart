abstract class FormularioConsultaState {}

class InitialFormularioConsultaState extends FormularioConsultaState {}

class SuccessFormularioConsultaState extends FormularioConsultaState {
  final String message;

  SuccessFormularioConsultaState(this.message);
}

class LoadingFormularioConsultaState extends FormularioConsultaState {}

class ErrorFormularioConsultaState extends FormularioConsultaState {
  final String message;

  ErrorFormularioConsultaState(this.message);
}