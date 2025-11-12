import 'package:flutter/material.dart';
import 'package:petcare/modules/historico/state/historico_state.dart';

import '../domain/usecase/historico_use_case.dart';

class HistoricoController extends ValueNotifier<HistoricoState> {
  final HistoricoUseCase _useCase;

  HistoricoController(this._useCase) : super(InitialHistoricoState());
}
