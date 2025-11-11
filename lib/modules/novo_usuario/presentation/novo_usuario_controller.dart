import 'package:flutter/material.dart';
import 'package:petcenter/modules/novo_usuario/state/novo_usuario_state.dart';

import '../domain/usecase/novo_usuario_use_case.dart';

class NovoUsuarioController extends ValueNotifier<NovoUsuarioState> {
  final NovoUsuarioUseCase _useCase;

  NovoUsuarioController(this._useCase) : super(InitialNovoUsuarioState());
}
