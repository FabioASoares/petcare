abstract class FarmaciaState {}

class InitialFarmaciaState extends FarmaciaState {}

class SuccessFarmaciaState extends FarmaciaState {
  final String message;

  SuccessFarmaciaState(this.message);
}

class LoadingFarmaciaState extends FarmaciaState {}

class ErrorFarmaciaState extends FarmaciaState {
  final String message;

  ErrorFarmaciaState(this.message);
}