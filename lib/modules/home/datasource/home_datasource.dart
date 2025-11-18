import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/home/utils/home_typedefs.dart';

import '../service/home_service.dart';

abstract class HomeDataSource {
  FutureListPetModel getListPets(String idTutor);
}

class HomeDataSourceImpl extends HomeDataSource {
  final HomeService _homeService;

  HomeDataSourceImpl(this._homeService);

  @override
  FutureListPetModel getListPets(String idTutor) async {
    final response = await _homeService.getListaPets(idTutor);

    return response.fold(
      (success) {
        final response = success.map(FormularioPetModel.fromMap).toList();
        return Success(response);
      },
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
