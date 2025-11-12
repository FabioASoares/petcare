import '../../repository/agenda_repository.dart';

abstract class AgendaUseCase {}

class AgendaUseCaseImpl implements AgendaUseCase {
  final AgendaRepository _agendaRepository;

  AgendaUseCaseImpl(this._agendaRepository);
}
