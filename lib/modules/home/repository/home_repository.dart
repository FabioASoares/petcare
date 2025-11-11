import '../datasource/home_datasource.dart';

abstract class HomeRepository {
 
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

}
