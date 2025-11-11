import 'package:petcenter/modules/home/datasource/home_datasource.dart';
import 'package:petcenter/modules/home/domain/usecase/home_use_case.dart';
import 'package:petcenter/modules/home/presentation/home_controller.dart';
import 'package:petcenter/modules/home/repository/home_repository.dart';

import '../../../core/injection/petcenter_modules.dart';
import '../service/home_service.dart';

class HomeModule {
  static const String _moduleName = 'Home';

  static void init() {
    final module = PetCenterModules.createModule(_moduleName);

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
    PetCenterModules.disposeModule(_moduleName);
  }

  static HomeController getController() {
    final module = PetCenterModules.getModule(_moduleName);
    return module.get<HomeController>();
  }
}
