import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_card_button.dart';
import 'package:petcare/core/customs/buttons/petcare_card_webview.dart';
import 'package:petcare/core/customs/buttons/petcare_grid_button.dart';
import 'package:petcare/core/customs/buttons/petcare_tab_button.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/agenda/domain/entities/historico_agendamento_entity.dart';
import 'package:petcare/modules/farmacia/presentation/farmacia_page.dart';
import 'package:petcare/modules/formulario_consulta/presentation/formulario_consulta_page.dart';
import 'package:petcare/modules/formulario_estetica/presentation/formulario_estetica_page.dart';
import 'package:petcare/modules/formulario_exame/presentation/formulario_exame_page.dart';
import 'package:petcare/modules/formulario_pet/domain/entities/formulario_pet_entity.dart';
import 'package:petcare/modules/formulario_pet/presentation/formulario_pet_page.dart';
import 'package:petcare/modules/home/di/home_module.dart';
import 'package:petcare/modules/home/presentation/components/petcare_menu_buttons.dart';
import 'package:petcare/modules/informacoes_pet/presentation/informacoes_pet_page.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';
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
                  backgroundImage: _controller.fotoPerfil != null
                      ? FileImage(_controller.fotoPerfil!)
                      : null,
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
            PetCareGridButton(
              spacing: 0,
              buttons: [
                ...montagemCardPets(_controller.meusPetsList ?? []),
                PetCareCardButton.outside(
                  title: "Adicionar",
                  onTap: irTelaAdicionarPet,
                  radius: 100,
                  backgroundColor: ColorsPC.turquesa.x350.withOpacity(0.1),
                  icon: MdiIcons.plus,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            montagemCardProximosAtendimentos(
              _controller.histAgendamentoList ?? [],
            ),
            PetCareTabButton(
              onTap: () {},
              title: "Consulta Dermatologica",
              subtitle: "Filomena",
              description: "09:00",
              rightWidget: PetCareText.body1(
                "22/11",
                paddings: const [0, 0, 16, 0],
                color: ColorsPC.turquesa.x500,
              ),
              icon: MdiIcons.stethoscope,
            ),
            PetCareMenuButtons(
              onTapConsulta: irTelaConsultas,
              onTapBanhoTosa: irTelaBanhoTosa,
              onTapFarmacia: irTelaFarmacia,
              onTapVacinas: irTelaVacinas,
              onTapExames: irTelaExames,
            ),
            PetCareCardWebView(
              asset: "assets/images/dog_post.webp",
              title: "Encontre um novo amigo!",
              description:
                  "Encontre um amigo para a vida toda. Adote com responsabilidade.",
              link:
                  "https://www.gov.br/saude/pt-br/campanhas-da-saude/2025/vacina-contra-a-raiva",
              buttonColor: ColorsPC.laranja.x200,
            ),
            PetCareCardWebView(
              asset: "assets/images/vacinacao_campanha.png",
              title: "Proteja seu Pet!",
              description: "Vacine seu amigo e o mantenha protegido.",
              link:
                  "https://prefeitura.sp.gov.br/web/saude/w/vigilancia_em_saude/controle_de_zoonoses/vacinacao_raiva",
              buttonColor: ColorsPC.amarelo.x200,
            ),
            montagemCardHistoricoAtendimentos(
              _controller.historicoAtendimento ?? [],
            ),
            PetCareTabButton(
              onTap: () {},
              title: "Banho e Tosa",
              subtitle: "Gohan",
              description: "16:30",
              rightWidget: PetCareText.body1(
                "20/10",
                paddings: const [0, 0, 16, 0],
                color: ColorsPC.turquesa.x500,
              ),
              icon: MdiIcons.shower,
            ),
          ],
        );
      },
    );
  }

  Widget montagemCardProximosAtendimentos(
      List<HistoricoAgendamentoEntity> list) {
    return Column(
      children: [
        PetCareText.h4(
          paddings: const [0, 20, 0, 10],
          "Proximos Agendamentos",
          color: ColorsPC.cinza.x700,
        ),
        ...list.map((item) => cardProximosAtendimentos(item))
      ],
    );
  }

  Widget montagemCardHistoricoAtendimentos(
      List<HistoricoAgendamentoEntity> list) {
    return Column(
      children: [
        PetCareText.h4(
          paddings: const [0, 20, 0, 10],
          "Histórico de Atendimentos",
          color: ColorsPC.cinza.x700,
        ),
        ...list.map((item) => cardHistoricoAtendimentos(item)),
      ],
    );
  }

  List<Widget> montagemCardPets(List<FormularioPetEntity> list) {
    return list.map((item) => cardMeuPet(item)).toList();
  }

  void irTelaConsultas() {
    NavigatorPC.pushNoNavigationBottomBar(
            context, const FormularioConsultaPage())
        .then(
      (value) => _controller.initDados(),
    );
    _controller.getListaPets();
  }

  void irTelaBanhoTosa() {
    NavigatorPC.pushNoNavigationBottomBar(
        context, const FormularioEsteticaPage());
  }

  void irTelaFarmacia() {
    NavigatorPC.pushNoNavigationBottomBar(context, const FarmaciaPage());
  }

  void irTelaVacinas() {
    NavigatorPC.pushNoNavigationBottomBar(context, const VacinacaoPage());
  }

  void irTelaExames() {
    NavigatorPC.pushNoNavigationBottomBar(context, const FormularioExamePage());
  }

  void irTelaAdicionarPet() {
    NavigatorPC.pushNoNavigationBottomBar(
      context,
      FormularioPetPage(
        usuario: widget.usuarioLogado,
      ),
    ).then(
      (value) => _controller.initDados(),
    );
  }

  Widget cardProximosAtendimentos(HistoricoAgendamentoEntity agendamentos) {
    return PetCareTabButton(
      onTap: () {},
      title: "Consulta Dermatologica",
      subtitle: "Filomena",
      description: "09:00",
      rightWidget: PetCareText.h3("10/08/2025"),
      icon: MdiIcons.abacus,
    );
  }

  Widget cardHistoricoAtendimentos(HistoricoAgendamentoEntity historico) {
    return const Column();
  }

  Widget cardMeuPet(FormularioPetEntity meuPet) {
    return PetCareCardButton.outside(
      asset: meuPet.fotoPet,
      title: meuPet.nomePet,
      onTap: () => irTelaInformacoesPet(meuPet),
      radius: 100,
      backgroundColor: ColorsPC.turquesa.x350.withOpacity(0.1),
    );
  }

  void irTelaInformacoesPet(FormularioPetEntity meuPet) {
    NavigatorPC.pushNoNavigationBottomBar(
      context,
      InformacoesPetPage(informacoesPet: meuPet),
    );
  }
}
