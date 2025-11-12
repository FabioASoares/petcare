import 'package:petcare/modules/formulario_estetica/datasource/formulario_estetica_datasource.dart';
import 'package:petcare/modules/formulario_estetica/domain/usecase/formulario_estetica_use_case.dart';
import 'package:petcare/modules/formulario_estetica/presentation/formulario_estetica_controller.dart';
import 'package:petcare/modules/formulario_estetica/repository/formulario_estetica_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/formulario_estetica_service.dart';

class FormularioEsteticaModule {
  static const String _moduleName = 'FormularioEstetica';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<FormularioEsteticaService>(FormularioEsteticaServiceImpl());

    module.register<FormularioEsteticaDataSource>(
      FormularioEsteticaDataSourceImpl(module.get<FormularioEsteticaService>()),
    );

    module.register<FormularioEsteticaRepository>(
      FormularioEsteticaRepositoryImpl(
          module.get<FormularioEsteticaDataSource>()),
    );

    module.register<FormularioEsteticaUseCase>(
      FormularioEsteticaUseCaseImpl(module.get<FormularioEsteticaRepository>()),
    );

    module.registerFactory<FormularioEsteticaController>(
      () =>
          FormularioEsteticaController(module.get<FormularioEsteticaUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static FormularioEsteticaController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<FormularioEsteticaController>();
  }
}
