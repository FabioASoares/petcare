import '../service/novo_usuario_service.dart';

abstract class NovoUsuarioDataSource {}

class NovoUsuarioDataSourceImpl extends NovoUsuarioDataSource {
  final NovoUsuarioService _novoUsuarioService;

  NovoUsuarioDataSourceImpl(this._novoUsuarioService);
}
