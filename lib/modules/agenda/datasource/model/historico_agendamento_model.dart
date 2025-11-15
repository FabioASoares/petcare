import 'package:map_fields/map_fields.dart';
import 'package:petcare/core/utils/typedefs.dart';

class HistoricoAgendamentoModel {
  final String idAgendamento;
  final String idTutor;
  final String nomeTutor;
  final String idPet;
  final String nomePet;
  final String dataAgendamento;
  final String horarioAtendimento;
  final String tipoAgendamento;
  final String telefoneContato;
  final String valorAtendimento;
  final String statusAtendimento;
  final String observacoesEspeciais;
  final String enderecoAtendimento;
  final String clinicaAtendimento;

  HistoricoAgendamentoModel({
    required this.idAgendamento,
    required this.idTutor,
    required this.nomeTutor,
    required this.idPet,
    required this.nomePet,
    required this.dataAgendamento,
    required this.horarioAtendimento,
    required this.tipoAgendamento,
    required this.telefoneContato,
    required this.valorAtendimento,
    required this.statusAtendimento,
    required this.observacoesEspeciais,
    required this.enderecoAtendimento,
    required this.clinicaAtendimento,
  });

  MapString toMap() {
    return {
      "idAgendamento": idAgendamento,
      "idTutor": idTutor,
      "nomeTutor": nomeTutor,
      "idPet": idPet,
      "dataAgendamento": dataAgendamento,
      "horarioAtendimento": horarioAtendimento,
      "tipoAgendamento": tipoAgendamento,
      "telefoneContato": telefoneContato,
      "valorAtendimento": valorAtendimento,
      "statusAtendimento": statusAtendimento,
      "observacoesEspeciais": observacoesEspeciais,
      "enderecoAtendimento": enderecoAtendimento,
      "clinicaAtendimento": clinicaAtendimento,
    };
  }

  factory HistoricoAgendamentoModel.fromMap(MapString obj) {
    final MapFields map = MapFields.load(obj);

    return HistoricoAgendamentoModel(
      idAgendamento: map.getString("idAgendamento", ""),
      idTutor: map.getString("idTutor", ""),
      nomeTutor: map.getString("nomeTutor", ""),
      idPet: map.getString("idPet", ""),
      nomePet: map.getString("nomePet", ""),
      dataAgendamento: map.getString("dataAgendamento", ""),
      horarioAtendimento: map.getString("horarioAtendimento", ""),
      tipoAgendamento: map.getString("tipoAgendamento", ""),
      telefoneContato: map.getString("telefoneContato", ""),
      valorAtendimento: map.getString("valorAtendimento", ""),
      statusAtendimento: map.getString("statusAtendimento", ""),
      observacoesEspeciais: map.getString("observacoesEspeciais", ""),
      enderecoAtendimento: map.getString("enderecoAtendimento", ""),
      clinicaAtendimento: map.getString("clinicaAtendimento", ""),
    );
  }
}
