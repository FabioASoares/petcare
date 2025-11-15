import 'package:petcare/modules/vacinacao/datasource/vacinacao_datasource.dart';
import 'package:petcare/modules/vacinacao/domain/usecase/vacinacao_use_case.dart';
import 'package:petcare/modules/vacinacao/presentation/vacinacao_controller.dart';
import 'package:petcare/modules/vacinacao/repository/vacinacao_repository.dart';

import '../../../core/injection/petcare_modules.dart';
import '../service/vacinacao_service.dart';

class VacinacaoModule {
  static const String _moduleName = 'Vacinacao';

  static void init() {
    final module = PetCareModules.createModule(_moduleName);

    module.register<VacinacaoService>(VacinacaoServiceImpl());

    module.register<VacinacaoDataSource>(
      VacinacaoDataSourceImpl(module.get<VacinacaoService>()),
    );

    module.register<VacinacaoRepository>(
      VacinacaoRepositoryImpl(module.get<VacinacaoDataSource>()),
    );

    module.register<VacinacaoUseCase>(
      VacinacaoUseCaseImpl(module.get<VacinacaoRepository>()),
    );

    module.registerFactory<VacinacaoController>(
      () => VacinacaoController(module.get<VacinacaoUseCase>()),
    );
  }

  static void dispose() {
    PetCareModules.disposeModule(_moduleName);
  }

  static VacinacaoController getController() {
    final module = PetCareModules.getModule(_moduleName);
    return module.get<VacinacaoController>();
  }
}
