import 'package:flutter/material.dart';
import 'package:petcenter/modules/agendar/state/agendar_state.dart';

import '../domain/usecase/agendar_use_case.dart';

class AgendarController extends ValueNotifier<AgendarState> {
  final AgendarUseCase _useCase;

  AgendarController(this._useCase) : super(InitialAgendarState());
}
