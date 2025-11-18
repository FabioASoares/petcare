import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/home/utils/home_typedefs.dart';

import '../datasource/home_datasource.dart';

abstract class HomeRepository {
  FutureListPetEntity getListaPet(String idTutor);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _remote;

  HomeRepositoryImpl(this._remote);

  @override
  FutureListPetEntity getListaPet(String idTutor) async {
    final response = await _remote.getListPets(idTutor);

    return response.fold(
      (success) {
        final response = success.map(FormularioPetEntity.fromModel).toList();
        return Success(response);
      },
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
