import 'package:map_fields/map_fields.dart';
import 'package:petcare/core/utils/typedefs.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';

class FormularioPetEntity {
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

  FormularioPetEntity({
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

  factory FormularioPetEntity.fromMap(MapString obj) {
    final map = MapFields.load(obj);

    return FormularioPetEntity(
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

  factory FormularioPetEntity.fromModel(FormularioPetModel model) {
    return FormularioPetEntity(
      idPet: model.idPet,
      idTutor: model.idTutor,
      nomePet: model.nomePet,
      nomeTutor: model.nomeTutor,
      fotoPet: model.fotoPet,
      telefoneTutor: model.telefoneTutor,
      dtNasicmentoPet: model.dtNasicmentoPet,
      generoPet: model.generoPet,
      especie: model.especie,
      raca: model.raca,
      porte: model.porte,
      peso: model.peso,
      castrado: model.castrado,
      numeroMicroChip: model.numeroMicroChip,
    );
  }
}
