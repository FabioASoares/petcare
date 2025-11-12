import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_estetica/state/formulario_estetica_state.dart';

import '../domain/usecase/formulario_estetica_use_case.dart';

class FormularioEsteticaController
    extends ValueNotifier<FormularioEsteticaState> {
  final FormularioEsteticaUseCase _useCase;

  FormularioEsteticaController(this._useCase)
      : super(InitialFormularioEsteticaState());
}
