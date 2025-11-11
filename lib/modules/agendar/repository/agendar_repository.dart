import '../datasource/agendar_datasource.dart';

abstract class AgendarRepository {
 
}

class AgendarRepositoryImpl implements AgendarRepository {
  final AgendarDataSource _dataSource;

  AgendarRepositoryImpl(this._dataSource);

}
