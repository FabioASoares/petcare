import 'package:petcare/modules/agenda/datasource/agenda_datasource.dart';
import 'package:petcare/modules/agenda/domain/usecase/agenda_use_case.dart';
import 'package:petcare/modules/agenda/presentation/agenda_controller.dart';
import 'package:petcare/modules/agenda/repository/agenda_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/agenda_service.dart';

class AgendaModule {
  static const String _moduleName = 'Agenda';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<AgendaService>(AgendaServiceImpl());

    module.register<AgendaDataSource>(
      AgendaDataSourceImpl(module.get<AgendaService>()),
    );

    module.register<AgendaRepository>(
      AgendaRepositoryImpl(module.get<AgendaDataSource>()),
    );

    module.register<AgendaUseCase>(
      AgendaUseCaseImpl(module.get<AgendaRepository>()),
    );

    module.registerFactory<AgendaController>(
      () => AgendaController(module.get<AgendaUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static AgendaController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<AgendaController>();
  }
}
