import '../../repository/formulario_exame_repository.dart';

abstract class FormularioExameUseCase {}

class FormularioExameUseCaseImpl implements FormularioExameUseCase {
  final FormularioExameRepository _formularioExameRepository;

  FormularioExameUseCaseImpl(this._formularioExameRepository);
}
