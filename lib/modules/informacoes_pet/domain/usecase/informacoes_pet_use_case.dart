import '../../repository/informacoes_pet_repository.dart';

abstract class InformacoesPetUseCase {}

class InformacoesPetUseCaseImpl implements InformacoesPetUseCase {
  final InformacoesPetRepository _informacoesPetRepository;

  InformacoesPetUseCaseImpl(this._informacoesPetRepository);
}
