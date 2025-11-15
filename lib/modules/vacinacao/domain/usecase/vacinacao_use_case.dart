import '../../repository/vacinacao_repository.dart';

abstract class VacinacaoUseCase {}

class VacinacaoUseCaseImpl implements VacinacaoUseCase {
  final VacinacaoRepository _vacinacaoRepository;

  VacinacaoUseCaseImpl(this._vacinacaoRepository);
}
