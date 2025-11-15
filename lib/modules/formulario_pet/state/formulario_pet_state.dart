abstract class FormularioPetState {}

class InitialFormularioPetState extends FormularioPetState {}

class SuccessFormularioPetState extends FormularioPetState {
  final String message;

  SuccessFormularioPetState(this.message);
}

class LoadingFormularioPetState extends FormularioPetState {}

class ErrorFormularioPetState extends FormularioPetState {
  final String message;

  ErrorFormularioPetState(this.message);
}