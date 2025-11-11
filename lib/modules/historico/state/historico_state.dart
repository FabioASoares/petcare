abstract class HistoricoState {}

class InitialHistoricoState extends HistoricoState {}

class SuccessHistoricoState extends HistoricoState {
  final String message;

  SuccessHistoricoState(this.message);
}

class LoadingHistoricoState extends HistoricoState {}

class ErrorHistoricoState extends HistoricoState {
  final String message;

  ErrorHistoricoState(this.message);
}