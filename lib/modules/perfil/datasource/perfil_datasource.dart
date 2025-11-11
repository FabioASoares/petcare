import '../service/perfil_service.dart';

abstract class PerfilDataSource {}

class PerfilDataSourceImpl extends PerfilDataSource {
  final PerfilService _perfilService;

  PerfilDataSourceImpl(this._perfilService);
}
