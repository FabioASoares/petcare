import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';
import 'package:petcare/modules/novo_usuario/utils/new_user_typedefs.dart';

import '../service/novo_usuario_service.dart';

abstract class NovoUsuarioRemoteDataSource {
  FutureUserModel criarConta(UserModel usuario);
}

class NovoUsuarioRemoteDataSourceImpl extends NovoUsuarioRemoteDataSource {
  final NovoUsuarioService _service;

  NovoUsuarioRemoteDataSourceImpl(this._service);

  @override
  FutureUserModel criarConta(UserModel usuario) async {
    final response = await _service.criarNovaConta(usuario.toMap());

    return response.fold(
      (success) => Success(UserModel.fromMap(success)),
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
