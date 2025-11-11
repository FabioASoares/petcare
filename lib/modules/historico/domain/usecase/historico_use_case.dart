import '../../repository/historico_repository.dart';

abstract class HistoricoUseCase {}

class HistoricoUseCaseImpl implements HistoricoUseCase {
  final HistoricoRepository _historicoRepository;

  HistoricoUseCaseImpl(this._historicoRepository);
}
