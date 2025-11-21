import '../service/informacoes_pet_service.dart';

abstract class InformacoesPetRemoteDataSource {}

class InformacoesPetRemoteDataSourceImpl
    extends InformacoesPetRemoteDataSource {
  final InformacoesPetService _service;

  InformacoesPetRemoteDataSourceImpl(this._service);
}
