import 'package:petcare/modules/pets/utils/typedefs.dart';

import '../../repository/pets_repository.dart';

abstract class PetsUseCase {
  FuturePetsEntity getListPets(String idTutor);
}

class PetsUseCaseImpl implements PetsUseCase {
  final PetsRepository _repository;

  PetsUseCaseImpl(this._repository);

  @override
  FuturePetsEntity getListPets(String idTutor) {
    return _repository.getListPets(idTutor);
  }
}
