import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:petcare/core/customs/buttons/petcare_card_button.dart';
import 'package:petcare/core/customs/buttons/petcare_grid_button.dart';

class PetCareMenuButtons extends StatelessWidget {
  final Function() onTapConsulta;
  final Function() onTapBanhoTosa;
  final Function() onTapMeusPets;
  final Function() onTapFarmacia;
  final Function() onTapVacinas;
  final Function() onTapExames;
  const PetCareMenuButtons({
    super.key,
    required this.onTapConsulta,
    required this.onTapBanhoTosa,
    required this.onTapMeusPets,
    required this.onTapFarmacia,
    required this.onTapVacinas,
    required this.onTapExames,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PetCareGridButton(
        buttons: [
          PetCareCardButton.inside(
            icon: MdiIcons.stethoscope,
            title: "Consulta",
            onTap: onTapConsulta,
          ),
          PetCareCardButton.inside(
            icon: MdiIcons.shower,
            title: "Banho e Tosa",
            onTap: onTapBanhoTosa,
          ),
          PetCareCardButton.inside(
            icon: Icons.pets,
            title: "Meus Pets",
            onTap: onTapMeusPets,
          ),
          PetCareCardButton.inside(
            icon: MdiIcons.pill,
            title: "Farmácia",
            onTap: onTapFarmacia,
          ),
          PetCareCardButton.inside(
            icon: MdiIcons.needle,
            title: "Vacinas",
            onTap: onTapVacinas,
          ),
          PetCareCardButton.inside(
            icon: MdiIcons.flaskEmptyOutline,
            title: "Exames",
            onTap: onTapExames,
          ),
        ],
      ),
    );
  }
}
