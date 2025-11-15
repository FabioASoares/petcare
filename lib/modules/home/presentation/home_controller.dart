import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petcare/modules/agenda/domain/entities/historico_agendamento_entity.dart';
import 'package:petcare/modules/home/state/home_state.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/pets/domain/entities/pet_entity.dart';

import '../domain/usecase/home_use_case.dart';

class HomeController extends ValueNotifier<HomeState> {
  final HomeUseCase _useCase;
  HomeController(this._useCase) : super(InitialHomeState());

  late UserEntity usuarioLogado;

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<File?> _fotoPerfil = ValueNotifier<File?>(null);
  final ValueNotifier<List<PetEntity>?> _meusPetsList =
      ValueNotifier<List<PetEntity>?>([]);
  final ValueNotifier<List<HistoricoAgendamentoEntity>?> _histAgendamentoList =
      ValueNotifier<List<HistoricoAgendamentoEntity>?>([]);

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
        _fotoPerfil,
        _meusPetsList,
        _histAgendamentoList,
      ]);

  bool get isLoading => _isLoading.value;
  File? get fotoPerfil => _fotoPerfil.value;
  List<PetEntity>? get meusPetsList => _meusPetsList.value;
  List<HistoricoAgendamentoEntity>? get histAgendamentoList =>
      _histAgendamentoList.value;

  Future<void> carregarFotoBase64() async {
    _isLoading.value = true;

    try {
      String base64String = usuarioLogado.fotoPerfil;

      base64String = base64String
          .replaceAll('\n', '')
          .replaceAll('\r', '')
          .replaceAll(' ', '')
          .trim();

      final bytes = base64Decode(base64String);

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/foto_perfil.png');

      await file.writeAsBytes(bytes);

      _fotoPerfil.value = file;
    } catch (e) {
      log("Erro ao carregar foto: $e");
    } finally {
      _isLoading.value = false;
    }
  }

  List<HistoricoAgendamentoEntity>? get historicoAtendimento {
    return _useCase.getHistoricoAtendimento(_histAgendamentoList.value ?? []);
  }

  List<HistoricoAgendamentoEntity>? get proximosAtendimentos {
    return _useCase.getProximosAtendimento(_histAgendamentoList.value ?? []);
  }

  Future<void> initDados() async {
    await carregarFotoBase64();
  }

  List<PetEntity> get listPets {
    return [
      PetEntity(
        idTutor: "",
        idPet: "",
        dtNascimentoPet: "",
        fotoPet: "",
        nomePet: "Apolo",
        racaPet: "",
      ),
      PetEntity(
        idTutor: "",
        idPet: "",
        dtNascimentoPet: "",
        fotoPet: "",
        nomePet: "Gohan",
        racaPet: "",
      ),
      PetEntity(
        idTutor: "",
        idPet: "",
        dtNascimentoPet: "",
        fotoPet: "",
        nomePet: "Marley",
        racaPet: "",
      ),
      PetEntity(
        idTutor: "",
        idPet: "",
        dtNascimentoPet: "",
        fotoPet: "",
        nomePet: "Filomena",
        racaPet: "",
      ),
    ];
  }
}
