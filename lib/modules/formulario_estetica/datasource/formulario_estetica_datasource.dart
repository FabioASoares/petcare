import '../service/formulario_estetica_service.dart';

abstract class FormularioEsteticaDataSource {}

class FormularioEsteticaDataSourceImpl extends FormularioEsteticaDataSource {
  final FormularioEsteticaService _formularioEsteticaService;

  FormularioEsteticaDataSourceImpl(this._formularioEsteticaService);
}
