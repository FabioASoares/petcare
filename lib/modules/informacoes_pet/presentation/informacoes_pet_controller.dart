import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/extension/string_extensions.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/informacoes_pet/state/informacoes_pet_state.dart';

import '../domain/usecase/informacoes_pet_use_case.dart';

class InformacoesPetController extends ValueNotifier<InformacoesPetState> {
  final InformacoesPetUseCase _useCase;

  InformacoesPetController(this._useCase) : super(InitialInformacoesPetState());
  late FormularioPetEntity informacoesPet;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
      ]);

  bool get isLoading => _isLoading.value;

  Uint8List get fotoPerfil {
    return informacoesPet.fotoPet.imageFromBase64String;
  }

  (String, Color) get castracaoText {
    return informacoesPet.castrado
        ? ("Sim", ColorsPC.verde.x400)
        : ("Não", ColorsPC.vermelho.x350);
  }

  String get racaText {
    final String raca = informacoesPet.raca;
    return raca == "Viralata" ? "S/R Definida" : raca;
  }

  Color get iconColors {
    return ColorsPC.turquesa.x450;
  }
}
