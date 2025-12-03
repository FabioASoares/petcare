import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/customs/petcare_card.dart';
import 'package:petcare/core/customs/petcare_row_text.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/perfil/di/perfil_module.dart';
import 'package:petcare/modules/perfil/presentation/custom/pet_care_row_icon_button.dart';
import 'package:petcare/modules/pets/presentation/pets_page.dart';

import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final UserEntity dadosUsuario;

  const PerfilPage({
    super.key,
    required this.dadosUsuario,
  });

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late PerfilController _controller;

  @override
  void initState() {
    super.initState();

    PerfilModule.init();
    _controller = PerfilModule.getController();
    _controller.dadosUsuario = widget.dadosUsuario;
  }

  @override
  void dispose() {
    PerfilModule.dispose();
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
          tituloAppBar: widget.dadosUsuario.nomeUsuario,
          tituloPagina: widget.dadosUsuario.email,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
          body: [
            PetCareCard(
              title: "Meus Dados",
              divider: true,
              paddingInside: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              body: [
                PetCareRowText(
                  title: "Nome Completo: ",
                  lable: widget.dadosUsuario.nomeUsuario,
                  leftIcon: Icons.person,
                  iconColor: ColorsPC.turquesa.x350,
                ),
                PetCareRowText(
                  title: "E-mail: ",
                  lable: widget.dadosUsuario.email,
                  leftIcon: Icons.email,
                  iconColor: ColorsPC.turquesa.x350,
                ),
                PetCareRowText(
                  title: "Nacionalidade: ",
                  lable: widget.dadosUsuario.nacionalidade,
                  leftIcon: Icons.local_airport,
                  iconColor: ColorsPC.turquesa.x350,
                ),
                PetCareRowText(
                  title: "Telefone: ",
                  lable: widget.dadosUsuario.telefone,
                  leftIcon: Icons.phone,
                  iconColor: ColorsPC.turquesa.x350,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.02.h),
                  child: PetCareRowText(
                    title: "Data de Nascimento: ",
                    lable: widget.dadosUsuario.dtNascimento,
                    leftIcon: Icons.cake,
                    iconColor: ColorsPC.turquesa.x350,
                    showDivider: false,
                  ),
                ),
              ],
            ),
            PetCareCard(
              title: "Meus Pets",
              divider: true,
              paddingInside: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              paddingOutside: const EdgeInsets.only(top: 20),
              body: [
                PetCareRowIconButton(
                  title: "Gerenciar Pets",
                  icon: Icons.pets,
                  iconColor: ColorsPC.system.pureWhite,
                  onTap: irParaMeusPets,
                  backgroundIconColor: ColorsPC.turquesa.x400.withOpacity(0.7),
                  showDivider: false,
                ),
              ],
            ),
            PetCareCard(
              title: "Configurações",
              divider: true,
              paddingInside: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              paddingOutside: const EdgeInsets.only(top: 20),
              body: [
                PetCareRowIconButton(
                  title: "Notifiações",
                  icon: Icons.notifications,
                  iconColor: ColorsPC.system.pureWhite,
                  onTap: () {},
                  backgroundIconColor: ColorsPC.turquesa.x400.withOpacity(0.7),
                  showDivider: true,
                ),
                PetCareRowIconButton(
                  title: "Segurança",
                  icon: Icons.lock,
                  iconColor: ColorsPC.system.pureWhite,
                  onTap: () {},
                  backgroundIconColor: ColorsPC.turquesa.x400.withOpacity(0.7),
                  showDivider: false,
                ),
              ],
            ),
            PetCareButton(
              paddings: const [0, 20, 0, 0],
              title: "Deslogar do PetCare",
              onTap: () {},
              buttonColor: ColorsPC.vermelho.x400,
              borderRadius: 10,
            ),
          ],
        );
      },
    );
  }

  void irParaMeusPets() {
    NavigatorPC.pushNoNavigationBottomBar(
      context,
      PetsPage(
        usuarioLogado: widget.dadosUsuario,
      ),
    );
  }
}
