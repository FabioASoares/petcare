import '../service/pets_service.dart';

abstract class PetsDataSource {}

class PetsDataSourceImpl extends PetsDataSource {
  final PetsService _petsService;

  PetsDataSourceImpl(this._petsService);
}
