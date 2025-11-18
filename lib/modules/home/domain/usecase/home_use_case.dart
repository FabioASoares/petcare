import 'package:petcare/modules/agenda/domain/entities/historico_agendamento_entity.dart';
import 'package:petcare/modules/home/utils/home_typedefs.dart';

import '../../repository/home_repository.dart';

abstract class HomeUseCase {
  List<HistoricoAgendamentoEntity> getHistoricoAtendimento(
      List<HistoricoAgendamentoEntity> listaAgendamento);
  List<HistoricoAgendamentoEntity> getProximosAtendimento(
      List<HistoricoAgendamentoEntity> listaAgendamento);
  FutureListPetEntity getListaPet(String idTutor);
}

class HomeUseCaseImpl implements HomeUseCase {
  final HomeRepository _repository;

  HomeUseCaseImpl(this._repository);

  @override
  List<HistoricoAgendamentoEntity> getHistoricoAtendimento(
      List<HistoricoAgendamentoEntity> listaAgendamento) {
    final hoje = DateTime.now();
    final apenasDataHoje = DateTime(hoje.year, hoje.month, hoje.day);

    return listaAgendamento.where((element) {
      final data = DateTime.parse(element.dataAgendamento);
      final apenasData = DateTime(data.year, data.month, data.day);

      return apenasData.isBefore(apenasDataHoje) ||
          apenasData.isAtSameMomentAs(apenasDataHoje);
    }).toList();
  }

  @override
  List<HistoricoAgendamentoEntity> getProximosAtendimento(
      List<HistoricoAgendamentoEntity> listaAgendamento) {
    final hoje = DateTime.now();
    final dataAtual = DateTime(hoje.year, hoje.month, hoje.day);

    return listaAgendamento.where((element) {
      final data = DateTime.parse(element.dataAgendamento);
      final apenasData = DateTime(data.year, data.month, data.day);

      return apenasData.isAfter(dataAtual) ||
          apenasData.isAtSameMomentAs(dataAtual);
    }).toList();
  }

  @override
  FutureListPetEntity getListaPet(String idTutor) {
    return _repository.getListaPet(idTutor);
  }
}
