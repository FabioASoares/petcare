import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_card.dart';
import 'package:petcare/core/customs/petcare_row_icon_text.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/extension/string_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/informacoes_pet/di/informacoes_pet_module.dart';

import 'informacoes_pet_controller.dart';

class InformacoesPetPage extends StatefulWidget {
  final FormularioPetEntity informacoesPet;
  const InformacoesPetPage({
    super.key,
    required this.informacoesPet,
  });

  @override
  State<InformacoesPetPage> createState() => _InformacoesPetPageState();
}

class _InformacoesPetPageState extends State<InformacoesPetPage> {
  late InformacoesPetController _controller;

  @override
  void initState() {
    super.initState();

    InformacoesPetModule.init();
    _controller = InformacoesPetModule.getController();
    _controller.informacoesPet = widget.informacoesPet;
  }

  @override
  void dispose() {
    InformacoesPetModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.listener,
      builder: (context, child) {
        return PetCareScaffold(
          isLoading: _controller.isLoading,
          showSliverAppbar: true,
          fotoAppBar: _controller.fotoPerfil,
          asset: widget.informacoesPet.fotoPet,
          tituloAppBar: widget.informacoesPet.nomePet,
          tituloPagina: widget.informacoesPet.especie,
          body: [
            PetCareCard(
              paddingOutside: EdgeInsets.only(top: 0.03.h),
              title: "Informações do Pet",
              divider: true,
              rightIcon: Icons.pets,
              rightIconColor: ColorsPC.turquesa.x350,
              body: [
                PetCareRowIconText(
                  icon: Icons.person_outline,
                  iconColor: _controller.iconColors,
                  title: "Tutor",
                  label: PetCareText.h6(widget.informacoesPet.nomeTutor),
                ),
                PetCareRowIconText(
                  icon: Icons.phone_outlined,
                  iconColor: _controller.iconColors,
                  title: "Telefone",
                  label: PetCareText.h6(widget.informacoesPet.telefoneTutor),
                ),
                PetCareRowIconText(
                  icon: MdiIcons.cake,
                  iconColor: _controller.iconColors,
                  title: "Data de Nascimento",
                  label: PetCareText.h6(widget.informacoesPet.dtNasicmentoPet),
                ),
                PetCareRowIconText(
                  icon: MdiIcons.genderMaleFemale,
                  iconColor: _controller.iconColors,
                  title: "Gênero",
                  label: PetCareText.h6(widget.informacoesPet.generoPet),
                ),
                PetCareRowIconText(
                  icon: Icons.pets,
                  iconColor: _controller.iconColors,
                  title: "Espécie",
                  label: PetCareText.h6(widget.informacoesPet.especie),
                ),
                PetCareRowIconText(
                  icon: MdiIcons.dna,
                  iconColor: _controller.iconColors,
                  title: "Raça",
                  label: PetCareText.h6(_controller.racaText),
                ),
                PetCareRowIconText(
                  icon: MdiIcons.scaleBalance,
                  iconColor: _controller.iconColors,
                  title: "Peso",
                  label: PetCareText.h6("${widget.informacoesPet.peso} Kg"),
                ),
                Visibility(
                  visible: !widget.informacoesPet.numeroMicroChip.nullOrEmpty,
                  child: PetCareRowIconText(
                    icon: Icons.memory,
                    iconColor: _controller.iconColors,
                    title: "N˚ Microchip",
                    label: PetCareText.h6(
                      widget.informacoesPet.numeroMicroChip!,
                    ),
                  ),
                ),
                PetCareRowIconText(
                  icon: MdiIcons.scissorsCutting,
                  iconColor: _controller.iconColors,
                  title: "Castrado",
                  label: PetCareText.h6(
                    _controller.castracaoText.$1,
                    color: _controller.castracaoText.$2,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
