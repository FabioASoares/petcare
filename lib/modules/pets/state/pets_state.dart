abstract class PetsState {}

class InitialPetsState extends PetsState {}

class SuccessPetsState extends PetsState {
  final String message;

  SuccessPetsState(this.message);
}

class LoadingPetsState extends PetsState {}

class ErrorPetsState extends PetsState {
  final String message;

  ErrorPetsState(this.message);
}