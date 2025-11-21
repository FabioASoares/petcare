import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/pets/utils/typedefs.dart';

import '../service/pets_service.dart';

abstract class PetsRemoteDataSource {
  FuturePetsModel getListPets(String idUsuario);
}

class PetsRemoteDataSourceImpl extends PetsRemoteDataSource {
  final PetsService _service;

  PetsRemoteDataSourceImpl(this._service);

  @override
  FuturePetsModel getListPets(String idUsuario) async {
    final response = await _service.getListPets(idUsuario);

    return response.fold(
      (success) {
        final list = success.map(FormularioPetModel.fromMap).toList();
        return Success(list);
      },
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
