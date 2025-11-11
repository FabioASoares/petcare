import '../datasource/farmacia_datasource.dart';

abstract class FarmaciaRepository {
 
}

class FarmaciaRepositoryImpl implements FarmaciaRepository {
  final FarmaciaDataSource _dataSource;

  FarmaciaRepositoryImpl(this._dataSource);

}
