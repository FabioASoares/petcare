import '../datasource/informacoes_pet_remote_datasource.dart';

abstract class InformacoesPetRepository {}

class InformacoesPetRepositoryImpl implements InformacoesPetRepository {
  final InformacoesPetRemoteDataSource _remote;

  InformacoesPetRepositoryImpl(this._remote);
}
