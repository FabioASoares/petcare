import '../datasource/formulario_estetica_datasource.dart';

abstract class FormularioEsteticaRepository {
 
}

class FormularioEsteticaRepositoryImpl implements FormularioEsteticaRepository {
  final FormularioEsteticaDataSource _dataSource;

  FormularioEsteticaRepositoryImpl(this._dataSource);

}
