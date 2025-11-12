abstract class AgendaState {}

class InitialAgendaState extends AgendaState {}

class SuccessAgendaState extends AgendaState {
  final String message;

  SuccessAgendaState(this.message);
}

class LoadingAgendaState extends AgendaState {}

class ErrorAgendaState extends AgendaState {
  final String message;

  ErrorAgendaState(this.message);
}