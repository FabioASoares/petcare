import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/formulario_pet/utils/formulario_pet_typedef.dart';

import '../../repository/formulario_pet_repository.dart';

abstract class FormularioPetUseCase {
  FutureCadastroPetEntity cadastrarNovoPet(FormularioPetModel formularioPet);
}

class FormularioPetUseCaseImpl implements FormularioPetUseCase {
  final FormularioPetRepository _repository;

  FormularioPetUseCaseImpl(this._repository);

  @override
  FutureCadastroPetEntity cadastrarNovoPet(FormularioPetModel formularioPet) {
    return _repository.cadastrarNovoPet(formularioPet);
  }
}
