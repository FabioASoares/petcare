import 'package:flutter/material.dart';
import 'package:petcare/modules/home/state/home_state.dart';

import '../domain/usecase/home_use_case.dart';

class HomeController extends ValueNotifier<HomeState> {
  final HomeUseCase _useCase;

  HomeController(this._useCase) : super(InitialHomeState());
}
