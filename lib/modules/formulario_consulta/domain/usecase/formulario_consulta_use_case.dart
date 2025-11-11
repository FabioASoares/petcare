import '../../repository/formulario_consulta_repository.dart';

abstract class FormularioConsultaUseCase {}

class FormularioConsultaUseCaseImpl implements FormularioConsultaUseCase {
  final FormularioConsultaRepository _formularioConsultaRepository;

  FormularioConsultaUseCaseImpl(this._formularioConsultaRepository);
}
