import 'package:petcare/modules/home/datasource/home_datasource.dart';
import 'package:petcare/modules/home/domain/usecase/home_use_case.dart';
import 'package:petcare/modules/home/presentation/home_controller.dart';
import 'package:petcare/modules/home/repository/home_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/home_service.dart';

class HomeModule {
  static const String _moduleName = 'Home';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<HomeService>(HomeServiceImpl());

    module.register<HomeDataSource>(
      HomeDataSourceImpl(module.get<HomeService>()),
    );

    module.register<HomeRepository>(
      HomeRepositoryImpl(module.get<HomeDataSource>()),
    );

    module.register<HomeUseCase>(
      HomeUseCaseImpl(module.get<HomeRepository>()),
    );

    module.registerFactory<HomeController>(
      () => HomeController(module.get<HomeUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static HomeController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<HomeController>();
  }
}
