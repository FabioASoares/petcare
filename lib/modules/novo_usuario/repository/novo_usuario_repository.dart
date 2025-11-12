import 'package:petcare/core/error/failure_generic_error.dart';
import 'package:petcare/core/helper/either.dart';
import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/novo_usuario/utils/new_user_typedefs.dart';

import '../datasource/novo_usuario_datasource.dart';

abstract class NovoUsuarioRepository {
  FutureUserEntity criarConta(UserModel usuario);
}

class NovoUsuarioRepositoryImpl implements NovoUsuarioRepository {
  final NovoUsuarioRemoteDataSource _remote;

  NovoUsuarioRepositoryImpl(this._remote);

  @override
  FutureUserEntity criarConta(UserModel usuario) async {
    final response = await _remote.criarConta(usuario);

    return response.fold(
      (success) => Success(UserEntity.fromModel(success)),
      (error) => Error(FailureGenericError(error.message)),
    );
  }
}
