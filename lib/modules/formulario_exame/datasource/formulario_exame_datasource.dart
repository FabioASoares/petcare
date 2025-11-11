import '../service/formulario_exame_service.dart';

abstract class FormularioExameDataSource {}

class FormularioExameDataSourceImpl extends FormularioExameDataSource {
  final FormularioExameService _formularioExameService;

  FormularioExameDataSourceImpl(this._formularioExameService);
}
