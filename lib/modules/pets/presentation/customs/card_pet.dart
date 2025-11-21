import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_foto_card.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';

class CardPet extends StatelessWidget {
  final FormularioPetEntity infoPet;
  const CardPet({super.key, required this.infoPet});

  @override
  Widget build(BuildContext context) {
    final String raca = infoPet.raca == "Viralata" ? "SRD" : infoPet.raca;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsPC.system.pureWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ColorsPC.cinza.x300.withOpacity(0.3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PetCareFotoCard(
              asset: infoPet.fotoPet,
              paddings: const [14, 14, 18, 14],
              radius: 100,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PetCareText.h6(
                    infoPet.nomePet,
                    semiBold: true,
                  ),
                  PetCareText.body2(
                    "${infoPet.especie}, $raca",
                    color: ColorsPC.cinza.x400,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: ColorsPC.turquesa.x400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
