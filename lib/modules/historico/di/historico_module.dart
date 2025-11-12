import 'package:petcare/modules/historico/datasource/historico_datasource.dart';
import 'package:petcare/modules/historico/domain/usecase/historico_use_case.dart';
import 'package:petcare/modules/historico/presentation/historico_controller.dart';
import 'package:petcare/modules/historico/repository/historico_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/historico_service.dart';

class HistoricoModule {
  static const String _moduleName = 'Historico';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<HistoricoService>(HistoricoServiceImpl());

    module.register<HistoricoDataSource>(
      HistoricoDataSourceImpl(module.get<HistoricoService>()),
    );

    module.register<HistoricoRepository>(
      HistoricoRepositoryImpl(module.get<HistoricoDataSource>()),
    );

    module.register<HistoricoUseCase>(
      HistoricoUseCaseImpl(module.get<HistoricoRepository>()),
    );

    module.registerFactory<HistoricoController>(
      () => HistoricoController(module.get<HistoricoUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static HistoricoController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<HistoricoController>();
  }
}
