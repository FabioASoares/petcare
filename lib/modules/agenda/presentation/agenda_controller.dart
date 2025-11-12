import 'package:flutter/material.dart';
import 'package:petcare/modules/agenda/state/agenda_state.dart';

import '../domain/usecase/agenda_use_case.dart';

class AgendaController extends ValueNotifier<AgendaState> {
  final AgendaUseCase _useCase;

  AgendaController(this._useCase) : super(InitialAgendaState());
}
