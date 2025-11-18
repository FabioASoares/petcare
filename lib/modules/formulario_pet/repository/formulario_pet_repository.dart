import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/formulario_pet/utils/formulario_pet_typedef.dart';

import '../datasource/formulario_pet_remote_datasource.dart';

abstract class FormularioPetRepository {
  FutureCadastroPetEntity cadastrarNovoPet(FormularioPetModel formularioPet);
}

class FormularioPetRepositoryImpl implements FormularioPetRepository {
  final FormularioPetRemoteDataSource _remote;

  FormularioPetRepositoryImpl(this._remote);

  @override
  FutureCadastroPetEntity cadastrarNovoPet(
    FormularioPetModel formularioPet,
  ) async {
    final response = await _remote.cadastrarNovoPet(formularioPet);

    return response.fold(
      (success) => Success(FormularioPetEntity.fromModel(success)),
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
