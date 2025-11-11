import 'package:petcenter/modules/formulario_consulta/datasource/formulario_consulta_datasource.dart';
import 'package:petcenter/modules/formulario_consulta/domain/usecase/formulario_consulta_use_case.dart';
import 'package:petcenter/modules/formulario_consulta/presentation/formulario_consulta_controller.dart';
import 'package:petcenter/modules/formulario_consulta/repository/formulario_consulta_repository.dart';

import '../../../core/injection/petcenter_modules.dart';
import '../service/formulario_consulta_service.dart';

class FormularioConsultaModule {
  static const String _moduleName = 'FormularioConsulta';

  static void init() {
    final module = PetCenterModules.createModule(_moduleName);

    module.register<FormularioConsultaService>(FormularioConsultaServiceImpl());

    module.register<FormularioConsultaDataSource>(
      FormularioConsultaDataSourceImpl(module.get<FormularioConsultaService>()),
    );

    module.register<FormularioConsultaRepository>(
      FormularioConsultaRepositoryImpl(module.get<FormularioConsultaDataSource>()),
    );

    module.register<FormularioConsultaUseCase>(
      FormularioConsultaUseCaseImpl(module.get<FormularioConsultaRepository>()),
    );

    module.registerFactory<FormularioConsultaController>(
      () => FormularioConsultaController(module.get<FormularioConsultaUseCase>()),
    );
  }

  static void dispose() {
    PetCenterModules.disposeModule(_moduleName);
  }

  static FormularioConsultaController getController() {
    final module = PetCenterModules.getModule(_moduleName);
    return module.get<FormularioConsultaController>();
  }
}
