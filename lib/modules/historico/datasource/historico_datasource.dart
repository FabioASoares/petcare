import '../service/historico_service.dart';

abstract class HistoricoDataSource {}

class HistoricoDataSourceImpl extends HistoricoDataSource {
  final HistoricoService _historicoService;

  HistoricoDataSourceImpl(this._historicoService);
}
