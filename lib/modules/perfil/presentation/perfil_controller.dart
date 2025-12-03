import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:petcare/core/extension/string_extensions.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/perfil/state/perfil_state.dart';

import '../domain/usecase/perfil_use_case.dart';

class PerfilController extends ValueNotifier<PerfilState> {
  final PerfilUseCase _useCase;

  PerfilController(this._useCase) : super(InitialPerfilState());

  late UserEntity dadosUsuario;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
      ]);

  bool get isLoading => _isLoading.value;

  Uint8List get fotoPerfil {
    return dadosUsuario.fotoPerfil.imageFromBase64String;
  }
}
