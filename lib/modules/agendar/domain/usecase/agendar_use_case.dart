import '../../repository/agendar_repository.dart';

abstract class AgendarUseCase {}

class AgendarUseCaseImpl implements AgendarUseCase {
  final AgendarRepository _agendarRepository;

  AgendarUseCaseImpl(this._agendarRepository);
}
