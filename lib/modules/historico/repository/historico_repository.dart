import '../datasource/historico_datasource.dart';

abstract class HistoricoRepository {
 
}

class HistoricoRepositoryImpl implements HistoricoRepository {
  final HistoricoDataSource _dataSource;

  HistoricoRepositoryImpl(this._dataSource);

}
