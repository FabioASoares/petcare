import '../datasource/vacinacao_datasource.dart';

abstract class VacinacaoRepository {
 
}

class VacinacaoRepositoryImpl implements VacinacaoRepository {
  final VacinacaoDataSource _dataSource;

  VacinacaoRepositoryImpl(this._dataSource);

}
