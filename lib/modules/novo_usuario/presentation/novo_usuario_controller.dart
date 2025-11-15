import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petcare/modules/novo_usuario/datasource/model/user_model.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/novo_usuario/state/novo_usuario_state.dart';

import '../domain/usecase/novo_usuario_use_case.dart';

class NovoUsuarioController extends ValueNotifier<NovoUsuarioState> {
  final NovoUsuarioUseCase _useCase;

  NovoUsuarioController(this._useCase) : super(InitialNovoUsuarioState());

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _showPasswordText = ValueNotifier<bool>(false);
  final ValueNotifier<String> _errorMessage = ValueNotifier("");
  final ValueNotifier<String> _successMessage = ValueNotifier("");
  final ValueNotifier<File?> _fotoPerfil = ValueNotifier<File?>(null);
  final ValueNotifier<UserEntity?> _usuarioLogado =
      ValueNotifier<UserEntity?>(null);

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController dtNascimentolController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
        _showPasswordText,
        emailController,
        senhaController,
        dtNascimentolController,
        telefoneController,
        nomeController,
        _errorMessage,
        _isLoadingFoto,
        _successMessage,
        _fotoPerfil,
        _usuarioLogado,
      ]);

  bool get isLoading => _isLoading.value;
  bool get showPasswordText => _showPasswordText.value;
  String get errorMessage => _errorMessage.value;
  String get successMessage => _successMessage.value;
  File? get fotoPerfil => _fotoPerfil.value;
  UserEntity? get usuarioLogado => _usuarioLogado.value;

  final ValueNotifier<bool> _isLoadingFoto = ValueNotifier(false);
  bool get isLoadingFoto => _isLoadingFoto.value;

  void setFotoPerfil(File file) {
    _fotoPerfil.value = file;
  }

  set isLoadingFoto(bool value) {
    _isLoadingFoto.value = value;
  }

  Future<void> carregarFoto(File file) async {
    _isLoadingFoto.value = true;

    try {
      final dir = await getTemporaryDirectory();
      final targetPath = '${dir.path}/foto_compress.jpg';

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

  IconData changeSuffixIcon() {
    return _showPasswordText.value
        ? Icons.visibility_off
        : Icons.remove_red_eye;
  }

  void showPassword() {
    _showPasswordText.value = !_showPasswordText.value;
  }

  Future<void> criarConta(
    Function() successFunction,
    Function() errorFunction,
  ) async {
    _isLoading.value = true;
    final response = await _useCase.criarConta(userModel);
    _isLoading.value = false;
    response.fold(
      (success) {
        _usuarioLogado.value = success;
        successFunction();
      },
      (error) {
        _errorMessage.value = error.message;
        errorFunction();
      },
    );
  }

  UserModel get userModel {
    return UserModel(
      email: emailController.text,
      dtNascimento: dtNascimentolController.text,
      telefone: telefoneController.text,
      fotoPerfil:
          fotoPerfil != null ? base64Encode(fotoPerfil!.readAsBytesSync()) : "",
      nacionalidade: "Brasileiro",
      userID: getUserID,
      nomeUsuario: nomeController.text,
    );
  }

  String get getUserID {
    String auth = "${emailController.text}:${senhaController.text}";
    return base64Encode(utf8.encode(auth)).trim();
  }
}
