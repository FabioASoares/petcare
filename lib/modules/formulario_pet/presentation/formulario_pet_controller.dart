import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petcare/core/enums/tap_selection_enum.dart';
import 'package:petcare/modules/formulario_pet/datasource/model/formulario_cadastro_pet.dart';
import 'package:petcare/modules/formulario_pet/state/formulario_pet_state.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';

import '../domain/usecase/formulario_pet_use_case.dart';

class FormularioPetController extends ValueNotifier<FormularioPetState> {
  final FormularioPetUseCase _useCase;

  FormularioPetController(this._useCase) : super(InitialFormularioPetState());
  late UserEntity usuarioLogado;
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<TapSelectionEnum> _selectionGenero =
      ValueNotifier(TapSelectionEnum.neutro);
  final ValueNotifier<TapSelectionEnum> _selectionCastracao =
      ValueNotifier(TapSelectionEnum.neutro);
  final TextEditingController nomeTutorController = TextEditingController();
  final TextEditingController telefoneTutorController = TextEditingController();
  final TextEditingController nomePetController = TextEditingController();
  final TextEditingController dtNascimentoPetController =
      TextEditingController();
  final TextEditingController racaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController microchipController = TextEditingController();
  final ValueNotifier<MapEntry<String, String>?> selectedItemListEspecie =
      ValueNotifier(null);
  final ValueNotifier<MapEntry<String, String>?> selectedItemListPorte =
      ValueNotifier(null);
  final ValueNotifier<String> _generoPet = ValueNotifier<String>("");
  final ValueNotifier<bool> _petCastrado = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isLoadingFoto = ValueNotifier(false);
  final ValueNotifier<File?> _fotoPerfil = ValueNotifier<File?>(null);

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
        nomeTutorController,
        telefoneTutorController,
        nomePetController,
        dtNascimentoPetController,
        racaController,
        pesoController,
        microchipController,
        _selectionGenero,
        _generoPet,
        _petCastrado,
        selectedItemListEspecie,
        selectedItemListPorte,
        _selectionCastracao,
        _isLoadingFoto,
        _fotoPerfil,
      ]);

  bool get isLoading => _isLoading.value;
  bool get isLoadingFoto => _isLoadingFoto.value;

  TapSelectionEnum get selecionGenero => _selectionGenero.value;
  TapSelectionEnum get selecionCastracao => _selectionCastracao.value;

  File? get fotoPet => _fotoPerfil.value;

  void onTapSimGenero() {
    _selectionGenero.value = TapSelectionEnum.sim;
    _generoPet.value = "Macho";
  }

  void onTapNaoGenero() {
    _selectionGenero.value = TapSelectionEnum.nao;
    _generoPet.value = "Fêmea";
  }

  void onTapSimCastrado() {
    _selectionCastracao.value = TapSelectionEnum.sim;
    _petCastrado.value = true;
  }

  void onTapNaoCastrado() {
    _selectionCastracao.value = TapSelectionEnum.nao;
    _petCastrado.value = false;
  }

  final List<MapEntry<String, String>> especiesList = [
    const MapEntry("1", 'Cachorro'),
    const MapEntry("2", 'Gato'),
    const MapEntry("3", 'Papagaio'),
    const MapEntry("4", 'Arara'),
    const MapEntry("5", 'Tartaruga'),
    const MapEntry("6", 'Coelho'),
    const MapEntry("7", 'Porquinho da India'),
    const MapEntry("8", 'Porco'),
    const MapEntry("9", 'Cavalo'),
    const MapEntry("10", 'Vaca / Boi'),
  ];

  final List<MapEntry<String, String>> porteList = [
    const MapEntry("1", 'Toy'),
    const MapEntry("2", 'Pequeno'),
    const MapEntry("3", 'Médio'),
    const MapEntry("4", 'Grande'),
  ];

  Future<void> cadastrarNovoPet(
    Function() onSuccess,
    Function() onError,
  ) async {
    _isLoading.value = true;
    final response = await _useCase.cadastrarNovoPet(formularioPet);
    _isLoading.value = false;
    response.fold(
      (success) => clearAllFields(),
      (error) => null,
    );
  }

  Future<void> carregarFoto(File file) async {
    _isLoadingFoto.value = true;

    try {
      final dir = await getTemporaryDirectory();
      final targetPath =
          '${dir.path}/foto_compress_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 50,
        minWidth: 500,
        minHeight: 500,
      );

      if (compressedFile != null) {
        final xfile = XFile(compressedFile.path);

        final fileFromXFile = File(xfile.path);

        _fotoPerfil.value = fileFromXFile;
      }
    } catch (e) {
      debugPrint('Erro ao carregar foto: $e');
    } finally {
      _isLoadingFoto.value = false;
    }
  }

  set isLoadingFoto(bool value) {
    _isLoadingFoto.value = value;
  }

  FormularioPetModel get formularioPet {
    return FormularioPetModel(
      idPet: null,
      idTutor: usuarioLogado.userID,
      nomePet: nomePetController.text,
      nomeTutor: usuarioLogado.nomeUsuario,
      fotoPet: _fotoPerfil.value != null
          ? base64Encode(_fotoPerfil.value!.readAsBytesSync())
          : "",
      telefoneTutor: usuarioLogado.telefone,
      dtNasicmentoPet: dtNascimentoPetController.text,
      generoPet: _generoPet.value,
      especie: selectedItemListEspecie.value?.value ?? "",
      raca: racaController.text,
      porte: selectedItemListPorte.value?.value ?? "",
      peso: pesoController.text,
      castrado: _petCastrado.value,
    );
  }

  Future<void> initDados() async {
    nomeTutorController.text = usuarioLogado.nomeUsuario;
    telefoneTutorController.text = usuarioLogado.telefone;
  }

  void clearAllFields() {
    nomePetController.clear();
    dtNascimentoPetController.clear();
    racaController.clear();
    pesoController.clear();
    microchipController.clear();

    _selectionGenero.value = TapSelectionEnum.neutro;
    _selectionCastracao.value = TapSelectionEnum.neutro;

    _generoPet.value = "";
    _petCastrado.value = false;

    selectedItemListEspecie.value = null;
    selectedItemListPorte.value = null;

    nomeTutorController.text = usuarioLogado.nomeUsuario;
    telefoneTutorController.text = usuarioLogado.telefone;

    notifyListeners();
  }
}
