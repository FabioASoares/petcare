import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_floating_button.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/modules/formulario_pet/presentation/formulario_pet_page.dart';
import 'package:petcare/modules/informacoes_pet/presentation/informacoes_pet_page.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/pets/di/pets_module.dart';
import 'package:petcare/modules/pets/presentation/customs/card_pet.dart';

import '../../formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'pets_controller.dart';

class PetsPage extends StatefulWidget {
  final UserEntity usuarioLogado;
  const PetsPage({
    super.key,
    required this.usuarioLogado,
  });

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  late PetsController _controller;

  @override
  void initState() {
    super.initState();

    PetsModule.init();
    _controller = PetsModule.getController();
    _controller.usuarioLogado = widget.usuarioLogado;
    _controller.initData();
  }

  @override
  void dispose() {
    PetsModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.listener,
      builder: (context, child) {
        return PetCareScaffold(
          onRefresh: () => _controller.getListPets(),
          isLoading: false,
          appBar: AppBar(
            backgroundColor: ColorsPC.system.background,
            title: const Text("Meus Pets"),
          ),
          body: [
            ...montarCardPets(_controller.listPets ?? []),
          ],
          floatingActionButton: PetCareFloatingButton(
            color: ColorsPC.turquesa.x450,
            onTap: irTelaCadastroPet,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }

  List<Widget> montarCardPets(List<FormularioPetEntity> listPets) {
    return listPets.map((e) => cardPetWidget(e)).toList();
  }

  Widget cardPetWidget(FormularioPetEntity infoPet) {
    return GestureDetector(
      onTap: () => goToInfoPet(infoPet),
      child: CardPet(infoPet: infoPet),
    );
  }

  void goToInfoPet(FormularioPetEntity infoPet) {
    NavigatorPC.pushNoNavigationBottomBar(
      context,
      InformacoesPetPage(informacoesPet: infoPet),
    );
  }

  void irTelaCadastroPet() {
    NavigatorPC.pushNoNavigationBottomBar(
      context,
      FormularioPetPage(
        usuario: widget.usuarioLogado,
      ),
    );
  }
}
