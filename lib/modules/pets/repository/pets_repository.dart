import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/pets/utils/typedefs.dart';

import '../datasource/pets_datasource.dart';

abstract class PetsRepository {
  FuturePetsEntity getListPets(String idTutor);
}

class PetsRepositoryImpl implements PetsRepository {
  final PetsRemoteDataSource _remote;

  PetsRepositoryImpl(this._remote);

  @override
  FuturePetsEntity getListPets(String idTutor) async {
    final response = await _remote.getListPets(idTutor);

    return response.fold(
      (success) {
        final list = success.map(FormularioPetEntity.fromModel).toList();
        return Success(list);
      },
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
