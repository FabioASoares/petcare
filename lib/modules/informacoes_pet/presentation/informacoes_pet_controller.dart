import 'package:flutter/material.dart';
import 'package:petcare/modules/informacoes_pet/state/informacoes_pet_state.dart';

import '../domain/usecase/informacoes_pet_use_case.dart';

class InformacoesPetController extends ValueNotifier<InformacoesPetState> {
  final InformacoesPetUseCase _useCase;

  InformacoesPetController(this._useCase) : super(InitialInformacoesPetState());
}
