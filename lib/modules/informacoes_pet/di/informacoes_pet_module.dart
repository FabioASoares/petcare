import 'package:dio/dio.dart';
import 'package:petcare/modules/informacoes_pet/datasource/informacoes_pet_datasource.dart';
import 'package:petcare/modules/informacoes_pet/domain/usecase/informacoes_pet_use_case.dart';
import 'package:petcare/modules/informacoes_pet/presentation/informacoes_pet_controller.dart';
import 'package:petcare/modules/informacoes_pet/repository/informacoes_pet_repository.dart';
import 'package:petcare/services/sevices.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/informacoes_pet_service.dart';

class InformacoesPetModule {
  static const String _moduleName = 'InformacoesPet';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<Dio>(Dio());

    module.register<GetServices>(ServicesImpl(module.get<Dio>()));

    module.register<InformacoesPetService>(InformacoesPetServiceImpl(
      module.get<GetServices>(),
    ));

    module.register<InformacoesPetDataSource>(
      InformacoesPetDataSourceImpl(module.get<InformacoesPetService>()),
    );

    module.register<InformacoesPetRepository>(
      InformacoesPetRepositoryImpl(module.get<InformacoesPetDataSource>()),
    );

    module.register<InformacoesPetUseCase>(
      InformacoesPetUseCaseImpl(module.get<InformacoesPetRepository>()),
    );

    module.registerFactory<InformacoesPetController>(
      () => InformacoesPetController(module.get<InformacoesPetUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static InformacoesPetController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<InformacoesPetController>();
  }
}
