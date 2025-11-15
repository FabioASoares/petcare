import '../service/informacoes_pet_service.dart';

abstract class InformacoesPetDataSource {}

class InformacoesPetDataSourceImpl extends InformacoesPetDataSource {
  final InformacoesPetService _informacoesPetService;

  InformacoesPetDataSourceImpl(this._informacoesPetService);
}
