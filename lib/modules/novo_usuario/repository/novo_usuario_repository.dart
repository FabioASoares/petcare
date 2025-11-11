import '../datasource/novo_usuario_datasource.dart';

abstract class NovoUsuarioRepository {
 
}

class NovoUsuarioRepositoryImpl implements NovoUsuarioRepository {
  final NovoUsuarioDataSource _dataSource;

  NovoUsuarioRepositoryImpl(this._dataSource);

}
