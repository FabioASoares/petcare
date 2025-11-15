import '../datasource/formulario_pet_datasource.dart';

abstract class FormularioPetRepository {
 
}

class FormularioPetRepositoryImpl implements FormularioPetRepository {
  final FormularioPetDataSource _dataSource;

  FormularioPetRepositoryImpl(this._dataSource);

}
