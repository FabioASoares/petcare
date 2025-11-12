import '../datasource/agenda_datasource.dart';

abstract class AgendaRepository {
 
}

class AgendaRepositoryImpl implements AgendaRepository {
  final AgendaDataSource _dataSource;

  AgendaRepositoryImpl(this._dataSource);

}
