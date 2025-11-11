import 'package:petcenter/modules/agendar/datasource/agendar_datasource.dart';
import 'package:petcenter/modules/agendar/domain/usecase/agendar_use_case.dart';
import 'package:petcenter/modules/agendar/presentation/agendar_controller.dart';
import 'package:petcenter/modules/agendar/repository/agendar_repository.dart';

import '../../../core/injection/petcenter_modules.dart';
import '../service/agendar_service.dart';

class AgendarModule {
  static const String _moduleName = 'Agendar';

  static void init() {
    final module = PetCenterModules.createModule(_moduleName);

    module.register<AgendarService>(AgendarServiceImpl());

    module.register<AgendarDataSource>(
      AgendarDataSourceImpl(module.get<AgendarService>()),
    );

    module.register<AgendarRepository>(
      AgendarRepositoryImpl(module.get<AgendarDataSource>()),
    );

    module.register<AgendarUseCase>(
      AgendarUseCaseImpl(module.get<AgendarRepository>()),
    );

    module.registerFactory<AgendarController>(
      () => AgendarController(module.get<AgendarUseCase>()),
    );
  }

  static void dispose() {
    PetCenterModules.disposeModule(_moduleName);
  }

  static AgendarController getController() {
    final module = PetCenterModules.getModule(_moduleName);
    return module.get<AgendarController>();
  }
}
