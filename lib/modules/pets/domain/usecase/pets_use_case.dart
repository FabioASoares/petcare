import '../../repository/pets_repository.dart';

abstract class PetsUseCase {}

class PetsUseCaseImpl implements PetsUseCase {
  final PetsRepository _petsRepository;

  PetsUseCaseImpl(this._petsRepository);
}
