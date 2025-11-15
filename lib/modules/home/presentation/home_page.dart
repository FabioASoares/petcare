import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/farmacia/presentation/farmacia_page.dart';
import 'package:petcare/modules/formulario_consulta/presentation/formulario_consulta_page.dart';
import 'package:petcare/modules/formulario_estetica/presentation/formulario_estetica_page.dart';
import 'package:petcare/modules/formulario_exame/presentation/formulario_exame_page.dart';
import 'package:petcare/modules/home/di/home_module.dart';
import 'package:petcare/modules/home/presentation/components/petcare_acesso_pets.dart';
import 'package:petcare/modules/home/presentation/components/petcare_menu_buttons.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
import 'package:petcare/modules/pets/presentation/pets_page.dart';
import 'package:petcare/modules/vacinacao/presentation/vacinacao_page.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final UserEntity usuarioLogado;
  const HomePage({
    super.key,
    required this.usuarioLogado,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();

    HomeModule.init();
    _controller = HomeModule.getController();
    _controller.usuarioLogado = widget.usuarioLogado;
    _controller.initDados();
  }

  @override
  void dispose() {
    HomeModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.listener,
      builder: (context, child) {
        return PetCareScaffold(
          isLoading: _controller.isLoading,
          appBar: AppBar(
            backgroundColor: ColorsPC.system.background,
            actions: const [],
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorsPC.turquesa.x400,
                  backgroundImage: FileImage(_controller.fotoPerfil!),
                ),
                PetCareText.h5(
                  "Olá, ${_controller.usuarioLogado.nomeUsuario}",
                  paddings: const [10, 0, 0, 0],
                )
              ],
            ),
          ),
          body: [
            PetCareText.h4(
              "Meus Pets",
              color: ColorsPC.cinza.x700,
            ),
            const SizedBox(
              height: 20,
            ),
            PetCareAcessoPets(
              onTapAdd: () {},
              onTapPet: (e) {},
              fotoPerfil: _controller.fotoPerfil!,
              pets: _controller.listPets,
            ),
            const SizedBox(
              height: 20,
            ),
            PetCareMenuButtons(
              onTapConsulta: irTelaConsultas,
              onTapBanhoTosa: irTelaBanhoTosa,
              onTapMeusPets: irTelaMeusPets,
              onTapFarmacia: irTelaFarmacia,
              onTapVacinas: irTelaVacinas,
              onTapExames: irTelaExames,
            ),
          ],
        );
      },
    );
  }

  void irTelaConsultas() {
    NavigatorPC.push(context, const FormularioConsultaPage());
  }

  void irTelaBanhoTosa() {
    NavigatorPC.push(context, const FormularioEsteticaPage());
  }

  void irTelaMeusPets() {
    NavigatorPC.push(context, const PetsPage());
  }

  void irTelaFarmacia() {
    NavigatorPC.push(context, const FarmaciaPage());
  }

  void irTelaVacinas() {
    NavigatorPC.push(context, const VacinacaoPage());
  }

  void irTelaExames() {
    NavigatorPC.push(context, const FormularioExamePage());
  }
}
