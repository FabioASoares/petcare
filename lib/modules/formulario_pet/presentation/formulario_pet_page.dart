import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/customs/buttons/petcare_selection_item.dart';
import 'package:petcare/core/customs/buttons/petcare_tap_button.dart';
import 'package:petcare/core/customs/petcare_card.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/customs/textfields/petcare_date_picket_textfield.dart';
import 'package:petcare/core/customs/textfields/petcare_textfield.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/image_helper.dart';
import 'package:petcare/modules/formulario_pet/di/formulario_pet_module.dart';
import 'package:petcare/modules/formulario_pet/presentation/components/petcare_card_foto.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';

import 'formulario_pet_controller.dart';

class FormularioPetPage extends StatefulWidget {
  final UserEntity usuario;
  const FormularioPetPage({
    super.key,
    required this.usuario,
  });

  @override
  State<FormularioPetPage> createState() => _FormularioPetPageState();
}

class _FormularioPetPageState extends State<FormularioPetPage> {
  late FormularioPetController _controller;

  @override
  void initState() {
    super.initState();

    FormularioPetModule.init();
    _controller = FormularioPetModule.getController();
    _controller.usuarioLogado = widget.usuario;
    _controller.initDados();
  }

  @override
  void dispose() {
    FormularioPetModule.dispose();
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
            centerTitle: true,
            title: const Text("Cadastro de Novo Pet"),
          ),
          body: [
            PetCareCardFoto(
              onTap: _selecionarImagem,
              isLoadingFoto: _controller.isLoadingFoto,
              foto: _controller.fotoPet,
            ),
            PetCareTextField(
              title: "Nome Tutor",
              controller: _controller.nomeTutorController,
              enable: false,
              topPadding: 18,
            ),
            PetCareTextField(
              title: "Telefone Tutor",
              controller: _controller.telefoneTutorController,
              enable: false,
              topPadding: 6,
            ),
            PetCareCard(
              title: "Informações do Pet",
              titleColor: ColorsPC.cinza.x700,
              divider: true,
              radius: 18,
              paddingOutside: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              paddingInside: const EdgeInsets.all(14),
              body: [
                PetCareTextField(
                  title: "Nome do Pet",
                  controller: _controller.nomePetController,
                  enable: true,
                  topPadding: 6,
                  placeholder: "Ex: Bob",
                ),
                PetCareDatePickerTextfield(
                  paddings: const [0, 14, 0, 0],
                  title: "Data de Nascimento",
                  controller: _controller.dtNascimentoPetController,
                  enable: true,
                  placeholder: "dd/mm/yyyy",
                ),
                PetCareTapButton(
                  label: "Gênero",
                  firstButtonName: "Macho",
                  secondButtonName: "Fêmea",
                  onTapFirstButton: () => _controller.onTapSimGenero(),
                  onTapSecondButton: () => _controller.onTapNaoGenero(),
                  selection: _controller.selecionGenero,
                  paddings: const [0, 10, 0, 0],
                ),
                PetCareSelectionItem(
                  title: "Espécie",
                  items: _controller.especiesList,
                  selectedItemNotifier: _controller.selectedItemListEspecie,
                  enable: true,
                  onSelectItem: () {},
                ),
                PetCareTextField(
                  title: "Raça",
                  controller: _controller.racaController,
                  enable: true,
                  topPadding: 6,
                  placeholder: "Ex: Vira Lata",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: PetCareTextField(
                          title: "Peso (kg)",
                          controller: _controller.pesoController,
                        ),
                      ),
                      Expanded(
                        child: PetCareTapButton(
                          label: "Castrado",
                          firstButtonName: "Sim",
                          secondButtonName: "Não",
                          onTapFirstButton: () =>
                              _controller.onTapSimCastrado(),
                          onTapSecondButton: () =>
                              _controller.onTapNaoCastrado(),
                          selection: _controller.selecionCastracao,
                          paddings: const [14, 0, 0, 0],
                          height: 0.05.h,
                        ),
                      ),
                    ],
                  ),
                ),
                PetCareSelectionItem(
                  title: "Porte",
                  items: _controller.porteList,
                  selectedItemNotifier: _controller.selectedItemListPorte,
                  enable: true,
                  onSelectItem: () {},
                ),
                PetCareTextField(
                  topPadding: 10,
                  title: "Microchip (Opcional)",
                  controller: _controller.microchipController,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PetCareButton(
                paddings: const [0, 10, 0, 10],
                title: "Salvar Pet",
                onTap: () =>
                    _controller.cadastrarNovoPet(() => null, () => null),
                borderRadius: 20,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selecionarImagem() async {
    _controller.isLoadingFoto = true;
    final imagemSelecionada = await ImageHelper.abrirGaleriaComLocalizacao();

    if (imagemSelecionada != null) {
      _controller.carregarFoto(imagemSelecionada.file);
    } else {
      _controller.isLoadingFoto = false;
    }
  }
}
