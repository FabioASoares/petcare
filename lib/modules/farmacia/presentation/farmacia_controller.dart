import 'package:flutter/material.dart';
import 'package:petcare/modules/farmacia/state/farmacia_state.dart';

import '../domain/usecase/farmacia_use_case.dart';

class FarmaciaController extends ValueNotifier<FarmaciaState> {
  final FarmaciaUseCase _useCase;

  FarmaciaController(this._useCase) : super(InitialFarmaciaState());
}
