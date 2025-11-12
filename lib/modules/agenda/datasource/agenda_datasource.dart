import '../service/agenda_service.dart';

abstract class AgendaDataSource {}

class AgendaDataSourceImpl extends AgendaDataSource {
  final AgendaService _agendaService;

  AgendaDataSourceImpl(this._agendaService);
}
