import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_pet/state/formulario_pet_state.dart';

import '../domain/usecase/formulario_pet_use_case.dart';

class FormularioPetController extends ValueNotifier<FormularioPetState> {
  final FormularioPetUseCase _useCase;

  FormularioPetController(this._useCase) : super(InitialFormularioPetState());
}
