import 'package:petcenter/modules/login/datasource/login_datasource.dart';
import 'package:petcenter/modules/login/domain/usecase/login_use_case.dart';
import 'package:petcenter/modules/login/presentation/login_controller.dart';
import 'package:petcenter/modules/login/repository/login_repository.dart';

import '../../../core/injection/petcenter_modules.dart';
import '../service/login_service.dart';

class LoginModule {
  static const String _moduleName = 'Login';

  static void init() {
    final module = PetCenterModules.createModule(_moduleName);

    module.register<LoginService>(LoginServiceImpl());

    module.register<LoginDataSource>(
      LoginDataSourceImpl(module.get<LoginService>()),
    );

    module.register<LoginRepository>(
      LoginRepositoryImpl(module.get<LoginDataSource>()),
    );

    module.register<LoginUseCase>(
      LoginUseCaseImpl(module.get<LoginRepository>()),
    );

    module.registerFactory<LoginController>(
      () => LoginController(module.get<LoginUseCase>()),
    );
  }

  static void dispose() {
    PetCenterModules.disposeModule(_moduleName);
  }

  static LoginController getController() {
    final module = PetCenterModules.getModule(_moduleName);
    return module.get<LoginController>();
  }
}
