import 'package:petcenter/modules/formulario_exame/datasource/formulario_exame_datasource.dart';
import 'package:petcenter/modules/formulario_exame/domain/usecase/formulario_exame_use_case.dart';
import 'package:petcenter/modules/formulario_exame/presentation/formulario_exame_controller.dart';
import 'package:petcenter/modules/formulario_exame/repository/formulario_exame_repository.dart';

import '../../../core/injection/petcenter_modules.dart';
import '../service/formulario_exame_service.dart';

class FormularioExameModule {
  static const String _moduleName = 'FormularioExame';

  static void init() {
    final module = PetCenterModules.createModule(_moduleName);

    module.register<FormularioExameService>(FormularioExameServiceImpl());

    module.register<FormularioExameDataSource>(
      FormularioExameDataSourceImpl(module.get<FormularioExameService>()),
    );

    module.register<FormularioExameRepository>(
      FormularioExameRepositoryImpl(module.get<FormularioExameDataSource>()),
    );

    module.register<FormularioExameUseCase>(
      FormularioExameUseCaseImpl(module.get<FormularioExameRepository>()),
    );

    module.registerFactory<FormularioExameController>(
      () => FormularioExameController(module.get<FormularioExameUseCase>()),
    );
  }

  static void dispose() {
    PetCenterModules.disposeModule(_moduleName);
  }

  static FormularioExameController getController() {
    final module = PetCenterModules.getModule(_moduleName);
    return module.get<FormularioExameController>();
  }
}
