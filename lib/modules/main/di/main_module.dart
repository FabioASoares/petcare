import 'package:petcare/core/injection/petcare_modules.dart';
import 'package:petcare/modules/main/domain/main_usecase.dart';
import 'package:petcare/modules/main/presentation/main_controller.dart';

class MainModule {
  static const String _moduleName = 'MainModule';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<MainUseCase>(MainUseCaseImpl());

    module.registerFactory<MainController>(
      () => MainController(module.get<MainUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static MainController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<MainController>();
  }
}
