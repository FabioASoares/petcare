import '../service/farmacia_service.dart';

abstract class FarmaciaDataSource {}

class FarmaciaDataSourceImpl extends FarmaciaDataSource {
  final FarmaciaService _farmaciaService;

  FarmaciaDataSourceImpl(this._farmaciaService);
}
