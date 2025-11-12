import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:petcare/modules/login/state/login_state.dart';

import '../domain/usecase/login_use_case.dart';

class LoginController extends ValueNotifier<LoginState> {
  final LoginUseCase _useCase;

  LoginController(this._useCase) : super(InitialLoginState());

  TextEditingController emailController = TextEditingController();

  Future<void> initData() async {
    await verificarPermissoes();
  }

  Future<void> verificarPermissoes() async {
    var cameraStatus = await Permission.camera.status;
    var locationStatus = await Permission.location.status;

    if (cameraStatus.isDenied) {
      cameraStatus = await Permission.camera.request();
    }

    if (locationStatus.isDenied) {
      locationStatus = await Permission.location.request();
    }
  }
}
