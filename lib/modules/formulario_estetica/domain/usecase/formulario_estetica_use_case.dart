import '../../repository/formulario_estetica_repository.dart';

abstract class FormularioEsteticaUseCase {}

class FormularioEsteticaUseCaseImpl implements FormularioEsteticaUseCase {
  final FormularioEsteticaRepository _formularioEsteticaRepository;

  FormularioEsteticaUseCaseImpl(this._formularioEsteticaRepository);
}
