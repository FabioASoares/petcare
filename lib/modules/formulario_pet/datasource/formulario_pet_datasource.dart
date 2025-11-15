import '../service/formulario_pet_service.dart';

abstract class FormularioPetDataSource {}

class FormularioPetDataSourceImpl extends FormularioPetDataSource {
  final FormularioPetService _formularioPetService;

  FormularioPetDataSourceImpl(this._formularioPetService);
}
