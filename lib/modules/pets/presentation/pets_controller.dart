import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/pets/state/pets_state.dart';

import '../domain/usecase/pets_use_case.dart';

class PetsController extends ValueNotifier<PetsState> {
  final PetsUseCase _useCase;

  PetsController(this._useCase) : super(InitialPetsState());

  late UserEntity usuarioLogado;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  final ValueNotifier<String> _errorMessage = ValueNotifier<String>("");
  final ValueNotifier<String> _successMessage = ValueNotifier<String>("");
  final ValueNotifier<List<FormularioPetEntity>?> _listPets =
      ValueNotifier<List<FormularioPetEntity>?>(null);

  Listenable get listener => Listenable.merge([
        this,
        _isLoading,
        _errorMessage,
        _successMessage,
        _listPets,
      ]);

  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  String get successMessage => _successMessage.value;
  List<FormularioPetEntity>? get listPets => _listPets.value;

  Future<void> getListPets() async {
    _isLoading.value = true;
    final response = await _useCase.getListPets(usuarioLogado.userID);
    _isLoading.value = false;

    response.fold(
      (success) {
        _listPets.value = success;
      },
      (error) {
        _errorMessage.value = error.message;
      },
    );
  }

  Future<void> initData() async {
    await getListPets();
  }
}
