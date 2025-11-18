import 'package:dio/dio.dart';
import 'package:petcare/modules/formulario_pet/datasource/formulario_pet_remote_datasource.dart';
import 'package:petcare/modules/formulario_pet/domain/usecase/formulario_pet_use_case.dart';
import 'package:petcare/modules/formulario_pet/presentation/formulario_pet_controller.dart';
import 'package:petcare/modules/formulario_pet/repository/formulario_pet_repository.dart';
import 'package:petcare/services/sevices.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/formulario_pet_service.dart';

class FormularioPetModule {
  static const String _moduleName = 'FormularioPet';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<Dio>(Dio());

    module.register<PostServices>(ServicesImpl(module.get<Dio>()));

    module.register<FormularioPetService>(FormularioPetServiceImpl(
      module.get<PostServices>(),
    ));

    module.register<FormularioPetRemoteDataSource>(
      FormularioPetRemoteDataSourceImpl(module.get<FormularioPetService>()),
    );

    module.register<FormularioPetRepository>(
      FormularioPetRepositoryImpl(module.get<FormularioPetRemoteDataSource>()),
    );

    module.register<FormularioPetUseCase>(
      FormularioPetUseCaseImpl(module.get<FormularioPetRepository>()),
    );

    module.registerFactory<FormularioPetController>(
      () => FormularioPetController(module.get<FormularioPetUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static FormularioPetController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<FormularioPetController>();
  }
}
