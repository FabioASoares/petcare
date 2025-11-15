import 'package:flutter/material.dart';
import 'package:petcare/modules/vacinacao/state/vacinacao_state.dart';

import '../domain/usecase/vacinacao_use_case.dart';

class VacinacaoController extends ValueNotifier<VacinacaoState> {
  final VacinacaoUseCase _useCase;

  VacinacaoController(this._useCase) : super(InitialVacinacaoState());
}
