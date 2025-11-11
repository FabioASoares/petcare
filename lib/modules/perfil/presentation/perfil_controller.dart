import 'package:flutter/material.dart';
import 'package:petcenter/modules/perfil/state/perfil_state.dart';

import '../domain/usecase/perfil_use_case.dart';

class PerfilController extends ValueNotifier<PerfilState> {
  final PerfilUseCase _useCase;

  PerfilController(this._useCase) : super(InitialPerfilState());
}
