abstract class FormularioEsteticaState {}

class InitialFormularioEsteticaState extends FormularioEsteticaState {}

class SuccessFormularioEsteticaState extends FormularioEsteticaState {
  final String message;

  SuccessFormularioEsteticaState(this.message);
}

class LoadingFormularioEsteticaState extends FormularioEsteticaState {}

class ErrorFormularioEsteticaState extends FormularioEsteticaState {
  final String message;

  ErrorFormularioEsteticaState(this.message);
}