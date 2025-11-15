import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_card_button.dart';
import 'package:petcare/core/customs/buttons/petcare_grid_button.dart';
import 'package:petcare/modules/pets/domain/entities/pet_entity.dart';

class PetCareAcessoPets extends StatelessWidget {
  final Function() onTapAdd;
  final Function(int i) onTapPet;
  final File? fotoPerfil;
  final List<PetEntity> pets;
  const PetCareAcessoPets({
    super.key,
    required this.onTapAdd,
    required this.onTapPet,
    required this.pets,
    this.fotoPerfil,
  });

  @override
  Widget build(BuildContext context) {
    return PetCareGridButton(
      spacing: 0,
      buttons: [
        ...pets.map(
          (e) => PetCareCardButton.outside(
            asset: fotoPerfil,
            title: e.nomePet,
            onTap: onTapAdd,
            radius: 100,
            backgroundColor: ColorsPC.turquesa.x350.withOpacity(0.1),
          ),
        ),
        PetCareCardButton.outside(
          title: "Adicionar",
          onTap: onTapAdd,
          radius: 100,
          backgroundColor: ColorsPC.turquesa.x350.withOpacity(0.1),
          icon: MdiIcons.plus,
        )
      ],
    );
  }
}
