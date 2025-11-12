import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_exame/state/formulario_exame_state.dart';

import '../domain/usecase/formulario_exame_use_case.dart';

class FormularioExameController extends ValueNotifier<FormularioExameState> {
  final FormularioExameUseCase _useCase;

  FormularioExameController(this._useCase)
      : super(InitialFormularioExameState());
}
