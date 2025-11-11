import 'package:petcenter/modules/farmacia/datasource/farmacia_datasource.dart';
import 'package:petcenter/modules/farmacia/domain/usecase/farmacia_use_case.dart';
import 'package:petcenter/modules/farmacia/presentation/farmacia_controller.dart';
import 'package:petcenter/modules/farmacia/repository/farmacia_repository.dart';

import '../../../core/injection/petcenter_modules.dart';
import '../service/farmacia_service.dart';

class FarmaciaModule {
  static const String _moduleName = 'Farmacia';

  static void init() {
    final module = PetCenterModules.createModule(_moduleName);

    module.register<FarmaciaService>(FarmaciaServiceImpl());

    module.register<FarmaciaDataSource>(
      FarmaciaDataSourceImpl(module.get<FarmaciaService>()),
    );

    module.register<FarmaciaRepository>(
      FarmaciaRepositoryImpl(module.get<FarmaciaDataSource>()),
    );

    module.register<FarmaciaUseCase>(
      FarmaciaUseCaseImpl(module.get<FarmaciaRepository>()),
    );

    module.registerFactory<FarmaciaController>(
      () => FarmaciaController(module.get<FarmaciaUseCase>()),
    );
  }

  static void dispose() {
    PetCenterModules.disposeModule(_moduleName);
  }

  static FarmaciaController getController() {
    final module = PetCenterModules.getModule(_moduleName);
    return module.get<FarmaciaController>();
  }
}
