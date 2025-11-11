import '../datasource/formulario_consulta_datasource.dart';

abstract class FormularioConsultaRepository {
 
}

class FormularioConsultaRepositoryImpl implements FormularioConsultaRepository {
  final FormularioConsultaDataSource _dataSource;

  FormularioConsultaRepositoryImpl(this._dataSource);

}
