import '../../repository/novo_usuario_repository.dart';

abstract class NovoUsuarioUseCase {}

class NovoUsuarioUseCaseImpl implements NovoUsuarioUseCase {
  final NovoUsuarioRepository _novoUsuarioRepository;

  NovoUsuarioUseCaseImpl(this._novoUsuarioRepository);
}
