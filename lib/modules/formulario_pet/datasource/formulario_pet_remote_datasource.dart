import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/formulario_pet/utils/formulario_pet_typedef.dart';

import '../service/formulario_pet_service.dart';

abstract class FormularioPetRemoteDataSource {
  FutureCadastroPetModel cadastrarNovoPet(FormularioPetModel formularioPet);
}

class FormularioPetRemoteDataSourceImpl extends FormularioPetRemoteDataSource {
  final FormularioPetService _service;

  FormularioPetRemoteDataSourceImpl(this._service);

  @override
  FutureCadastroPetModel cadastrarNovoPet(
    FormularioPetModel formularioPet,
  ) async {
    final response = await _service.cadastrarPet(formularioPet.toMap());

    return response.fold(
      (success) => Success(FormularioPetModel.fromMap(success)),
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
