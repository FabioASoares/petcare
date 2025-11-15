import '../datasource/informacoes_pet_datasource.dart';

abstract class InformacoesPetRepository {
 
}

class InformacoesPetRepositoryImpl implements InformacoesPetRepository {
  final InformacoesPetDataSource _dataSource;

  InformacoesPetRepositoryImpl(this._dataSource);

}
