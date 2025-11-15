import 'package:flutter/material.dart';
import 'package:petcare/modules/agenda/domain/entities/historico_agendamento_entity.dart';

class PetCareAgendamentos extends StatelessWidget {
  final String title;
  final HistoricoAgendamentoEntity agendamento;
  const PetCareAgendamentos({
    super.key,
    required this.title,
    required this.agendamento,
  });

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
