import 'package:petcare/modules/pets/datasource/pets_datasource.dart';
import 'package:petcare/modules/pets/domain/usecase/pets_use_case.dart';
import 'package:petcare/modules/pets/presentation/pets_controller.dart';
import 'package:petcare/modules/pets/repository/pets_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/pets_service.dart';

class PetsModule {
  static const String _moduleName = 'Pets';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<PetsService>(PetsServiceImpl());

    module.register<PetsDataSource>(
      PetsDataSourceImpl(module.get<PetsService>()),
    );

    module.register<PetsRepository>(
      PetsRepositoryImpl(module.get<PetsDataSource>()),
    );

    module.register<PetsUseCase>(
      PetsUseCaseImpl(module.get<PetsRepository>()),
    );

    module.registerFactory<PetsController>(
      () => PetsController(module.get<PetsUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static PetsController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<PetsController>();
  }
}
