import '../datasource/formulario_exame_datasource.dart';

abstract class FormularioExameRepository {
 
}

class FormularioExameRepositoryImpl implements FormularioExameRepository {
  final FormularioExameDataSource _dataSource;

  FormularioExameRepositoryImpl(this._dataSource);

}
