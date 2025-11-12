import 'package:dio/dio.dart';
import 'package:petcare/modules/novo_usuario/datasource/novo_usuario_datasource.dart';
import 'package:petcare/modules/novo_usuario/domain/usecase/novo_usuario_use_case.dart';
import 'package:petcare/modules/novo_usuario/presentation/novo_usuario_controller.dart';
import 'package:petcare/modules/novo_usuario/repository/novo_usuario_repository.dart';
import 'package:petcare/services/sevices.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/novo_usuario_service.dart';

class NovoUsuarioModule {
  static const String _moduleName = 'NovoUsuario';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<Dio>(Dio());

    module.register<PostServices>(ServicesImpl(module.get<Dio>()));

    module.register<NovoUsuarioService>(
        NovoUsuarioServiceImpl(module.get<PostServices>()));

    module.register<NovoUsuarioRemoteDataSource>(
      NovoUsuarioRemoteDataSourceImpl(module.get<NovoUsuarioService>()),
    );

    module.register<NovoUsuarioRepository>(
      NovoUsuarioRepositoryImpl(module.get<NovoUsuarioRemoteDataSource>()),
    );

    module.register<NovoUsuarioUseCase>(
      NovoUsuarioUseCaseImpl(module.get<NovoUsuarioRepository>()),
    );

    module.registerFactory<NovoUsuarioController>(
      () => NovoUsuarioController(module.get<NovoUsuarioUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static NovoUsuarioController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<NovoUsuarioController>();
  }
}
