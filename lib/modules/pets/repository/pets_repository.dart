import '../datasource/pets_datasource.dart';

abstract class PetsRepository {
 
}

class PetsRepositoryImpl implements PetsRepository {
  final PetsDataSource _dataSource;

  PetsRepositoryImpl(this._dataSource);

}
