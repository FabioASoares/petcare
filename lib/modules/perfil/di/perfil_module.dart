import 'package:petcare/modules/perfil/datasource/perfil_datasource.dart';
import 'package:petcare/modules/perfil/domain/usecase/perfil_use_case.dart';
import 'package:petcare/modules/perfil/presentation/perfil_controller.dart';
import 'package:petcare/modules/perfil/repository/perfil_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/perfil_service.dart';

class PerfilModule {
  static const String _moduleName = 'Perfil';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<PerfilService>(PerfilServiceImpl());

    module.register<PerfilDataSource>(
      PerfilDataSourceImpl(module.get<PerfilService>()),
    );

    module.register<PerfilRepository>(
      PerfilRepositoryImpl(module.get<PerfilDataSource>()),
    );

    module.register<PerfilUseCase>(
      PerfilUseCaseImpl(module.get<PerfilRepository>()),
    );

    module.registerFactory<PerfilController>(
      () => PerfilController(module.get<PerfilUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static PerfilController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<PerfilController>();
  }
}
