abstract class FormularioExameState {}

class InitialFormularioExameState extends FormularioExameState {}

class SuccessFormularioExameState extends FormularioExameState {
  final String message;

  SuccessFormularioExameState(this.message);
}

class LoadingFormularioExameState extends FormularioExameState {}

class ErrorFormularioExameState extends FormularioExameState {
  final String message;

  ErrorFormularioExameState(this.message);
}