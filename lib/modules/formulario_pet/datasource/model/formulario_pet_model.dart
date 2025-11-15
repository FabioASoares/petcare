import 'package:map_fields/map_fields.dart';
import 'package:petcare/core/utils/typedefs.dart';

class FormularioPetModel {
  final String? idPet;
  final String idTutor;
  final String nomePet;
  final String nomeTutor;
  final String fotoPet;
  final String telefoneTutor;
  final String dtNasicmentoPet;
  final String generoPet;
  final String especie;
  final String raca;
  final String porte;
  final String peso;
  final bool castrado;
  final String? numeroMicroChip;

  FormularioPetModel({
    required this.idPet,
    required this.idTutor,
    required this.nomePet,
    required this.nomeTutor,
    required this.fotoPet,
    required this.telefoneTutor,
    required this.dtNasicmentoPet,
    required this.generoPet,
    required this.especie,
    required this.raca,
    required this.porte,
    required this.peso,
    required this.castrado,
    this.numeroMicroChip,
  });

  MapString toMap() {
    return {
      "idPet": idPet,
      "idTutor": idTutor,
      "nomePet": nomePet,
      "nomeTutor": nomeTutor,
      "fotoPet": fotoPet,
      "telefoneTutor": telefoneTutor,
      "dtNasicmentoPet": dtNasicmentoPet,
      "generoPet": generoPet,
      "especie": especie,
      "raca": raca,
      "porte": porte,
      "peso": peso,
      "castrado": castrado,
      "numeroMicroChip": numeroMicroChip,
    };
  }

  factory FormularioPetModel.fromMap(MapString obj) {
    final map = MapFields.load(obj);

    return FormularioPetModel(
      idPet: map.getString("idPet", ""),
      idTutor: map.getString("idTutor", ""),
      nomePet: map.getString("nomePet", ""),
      nomeTutor: map.getString("nomeTutor", ""),
      fotoPet: map.getString("fotoPet", ""),
      telefoneTutor: map.getString("telefoneTutor", ""),
      dtNasicmentoPet: map.getString("dtNasicmentoPet", ""),
      generoPet: map.getString("generoPet", ""),
      especie: map.getString("especie", ""),
      raca: map.getString("raca", ""),
      porte: map.getString("porte", ""),
      peso: map.getString("peso", ""),
      castrado: map.getBool("castrado", false),
      numeroMicroChip: map.getString("numeroMicroChip", ""),
    );
  }
}
