import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';
import 'package:petcare/modules/novo_usuario/utils/new_user_typedefs.dart';

import '../../repository/novo_usuario_repository.dart';

abstract class NovoUsuarioUseCase {
  FutureUserEntity criarConta(UserModel usuario);
}

class NovoUsuarioUseCaseImpl implements NovoUsuarioUseCase {
  final NovoUsuarioRepository _repository;

  NovoUsuarioUseCaseImpl(this._repository);

  @override
  FutureUserEntity criarConta(UserModel usuario) {
    return _repository.criarConta(usuario);
  }
}
