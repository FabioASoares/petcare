import 'package:petcare/modules/formulario_consulta/datasource/formulario_consulta_datasource.dart';
import 'package:petcare/modules/formulario_consulta/domain/usecase/formulario_consulta_use_case.dart';
import 'package:petcare/modules/formulario_consulta/presentation/formulario_consulta_controller.dart';
import 'package:petcare/modules/formulario_consulta/repository/formulario_consulta_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/formulario_consulta_service.dart';

class FormularioConsultaModule {
  static const String _moduleName = 'FormularioConsulta';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<FormularioConsultaService>(FormularioConsultaServiceImpl());

    module.register<FormularioConsultaDataSource>(
      FormularioConsultaDataSourceImpl(module.get<FormularioConsultaService>()),
    );

    module.register<FormularioConsultaRepository>(
      FormularioConsultaRepositoryImpl(
          module.get<FormularioConsultaDataSource>()),
    );

    module.register<FormularioConsultaUseCase>(
      FormularioConsultaUseCaseImpl(module.get<FormularioConsultaRepository>()),
    );

    module.registerFactory<FormularioConsultaController>(
      () =>
          FormularioConsultaController(module.get<FormularioConsultaUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static FormularioConsultaController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<FormularioConsultaController>();
  }
}
