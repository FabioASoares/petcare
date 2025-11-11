import '../service/agendar_service.dart';

abstract class AgendarDataSource {}

class AgendarDataSourceImpl extends AgendarDataSource {
  final AgendarService _agendarService;

  AgendarDataSourceImpl(this._agendarService);
}
