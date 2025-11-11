import '../../repository/farmacia_repository.dart';

abstract class FarmaciaUseCase {}

class FarmaciaUseCaseImpl implements FarmaciaUseCase {
  final FarmaciaRepository _farmaciaRepository;

  FarmaciaUseCaseImpl(this._farmaciaRepository);
}
