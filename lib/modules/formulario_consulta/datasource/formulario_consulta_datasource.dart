import '../service/formulario_consulta_service.dart';

abstract class FormularioConsultaDataSource {}

class FormularioConsultaDataSourceImpl extends FormularioConsultaDataSource {
  final FormularioConsultaService _formularioConsultaService;

  FormularioConsultaDataSourceImpl(this._formularioConsultaService);
}
