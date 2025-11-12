import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:petcare/modules/login/state/login_state.dart';

import '../domain/usecase/login_use_case.dart';

class LoginController extends ValueNotifier<LoginState> {
  final LoginUseCase _useCase;

  LoginController(this._useCase) : super(InitialLoginState());

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _showPasswordText = ValueNotifier<bool>(false);
  final ValueNotifier<String> _errorMessage = ValueNotifier<String>("");
  final ValueNotifier<String> _successMessage = ValueNotifier<String>("");

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
        emailController,
        senhaController,
        _errorMessage,
        _successMessage,
        _showPasswordText,
      ]);

  bool get isLoading => _isLoading.value;
  bool get showPasswordText => _showPasswordText.value;
  String get errorMessage => _errorMessage.value;
  String get successMessage => _successMessage.value;

  Future<void> initData() async {
    await verificarPermissoes();
  }

  IconData changeSuffixIcon() {
    return _showPasswordText.value
        ? Icons.visibility_off
        : Icons.remove_red_eye;
  }

  void showPassword() {
    _showPasswordText.value = !_showPasswordText.value;
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

  Future<void> logarPetCare(
    Function() successFunction,
    Function() errorFunction,
  ) async {
    _isLoading.value = true;
    final response = await _useCase.logarPetCare(mountUserID);
    _isLoading.value = false;
    response.fold(
      (success) => successFunction(),
      (error) {
        _errorMessage.value = error.message;
        errorFunction();
      },
    );
  }

  String get mountUserID {
    String auth = "${emailController.text}:${senhaController.text}";
    return base64Encode(utf8.encode(auth)).trim();
  }
}
