import '../service/vacinacao_service.dart';

abstract class VacinacaoDataSource {}

class VacinacaoDataSourceImpl extends VacinacaoDataSource {
  final VacinacaoService _vacinacaoService;

  VacinacaoDataSourceImpl(this._vacinacaoService);
}
