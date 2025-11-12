import 'package:flutter/material.dart';
import 'package:petcare/modules/pets/state/pets_state.dart';

import '../domain/usecase/pets_use_case.dart';

class PetsController extends ValueNotifier<PetsState> {
  final PetsUseCase _useCase;

  PetsController(this._useCase) : super(InitialPetsState());
}
