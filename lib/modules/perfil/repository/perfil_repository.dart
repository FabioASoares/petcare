import '../datasource/perfil_datasource.dart';

abstract class PerfilRepository {
 
}

class PerfilRepositoryImpl implements PerfilRepository {
  final PerfilDataSource _dataSource;

  PerfilRepositoryImpl(this._dataSource);

}
