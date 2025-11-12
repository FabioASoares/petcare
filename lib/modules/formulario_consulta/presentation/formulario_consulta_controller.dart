import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_consulta/state/formulario_consulta_state.dart';

import '../domain/usecase/formulario_consulta_use_case.dart';

class FormularioConsultaController
    extends ValueNotifier<FormularioConsultaState> {
  final FormularioConsultaUseCase _useCase;

  FormularioConsultaController(this._useCase)
      : super(InitialFormularioConsultaState());
}
