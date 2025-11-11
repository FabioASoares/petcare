import '../../repository/perfil_repository.dart';

abstract class PerfilUseCase {}

class PerfilUseCaseImpl implements PerfilUseCase {
  final PerfilRepository _perfilRepository;

  PerfilUseCaseImpl(this._perfilRepository);
}
