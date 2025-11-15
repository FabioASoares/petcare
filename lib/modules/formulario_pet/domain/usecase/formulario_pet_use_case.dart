import '../../repository/formulario_pet_repository.dart';

abstract class FormularioPetUseCase {}

class FormularioPetUseCaseImpl implements FormularioPetUseCase {
  final FormularioPetRepository _formularioPetRepository;

  FormularioPetUseCaseImpl(this._formularioPetRepository);
}
