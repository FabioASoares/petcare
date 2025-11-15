import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/customs/petcare_circle_avatar.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/customs/textfields/petcare_textfield.dart';
import 'package:petcare/core/helper/image_helper.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/home/presentation/home_page.dart';
import 'package:petcare/modules/novo_usuario/di/novo_usuario_module.dart';

import '../../../core/customs/textfields/date_picker_textfield.dart';
import '../../utils/toasts_message.dart';
import 'novo_usuario_controller.dart';

class NovoUsuarioPage extends StatefulWidget {
  const NovoUsuarioPage({super.key});

  @override
  State<NovoUsuarioPage> createState() => _NovoUsuarioPageState();
}

class _NovoUsuarioPageState extends State<NovoUsuarioPage> {
  late NovoUsuarioController _controller;

  @override
  void initState() {
    super.initState();

    NovoUsuarioModule.init();
    _controller = NovoUsuarioModule.getController();
  }

  @override
  void dispose() {
    NovoUsuarioModule.dispose();
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
              title: const Text(
                "Criar Conta",
                textAlign: TextAlign.center,
              ),
            ),
            body: [
              PetCareCircleAvatar(
                loadingState: _controller.isLoadingFoto,
                file: _controller.fotoPerfil,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: PetCareText.h3(
                  "Adicione sua foto de perfil",
                  paddings: const [0, 0, 0, 20],
                ),
              ),
              PetCareButton(
                title: "Fazer upload de foto",
                onTap: _selecionarImagem,
                borderRadius: 10,
                paddings: const [0, 0, 0, 30],
              ),
              PetCareText.h4(
                "Dados Cadastrais",
                paddings: const [10, 0, 0, 20],
              ),
              PetCareTextField(
                paddings: const [10, 6, 10, 20],
                controller: _controller.nomeController,
                prefixIcon: Icons.person_2,
                placeholder: "Como você se chama?",
              ),
              PetCareTextField(
                paddings: const [10, 6, 10, 20],
                controller: _controller.emailController,
                prefixIcon: Icons.alternate_email,
                placeholder: "Qual seu e-mail?",
              ),
              PetCareDatePickerField(
                paddings: const [10, 6, 10, 20],
                controller: _controller.dtNascimentolController,
                prefixIcon: Icons.pets,
                placeholder: "Em que ano você nasceu?",
              ),
              PetCareTextField(
                paddings: const [10, 6, 10, 20],
                controller: _controller.telefoneController,
                prefixIcon: Icons.phone,
                placeholder: "Qual seu telefone para contato?",
              ),
              PetCareTextField(
                paddings: const [10, 6, 10, 40],
                controller: _controller.senhaController,
                prefixIcon: Icons.lock,
                placeholder: "Digite sua senha",
                obscureText: !_controller.showPasswordText,
                suffixIcon: _controller.changeSuffixIcon(),
                onTapSuffixIcon: () => _controller.showPassword(),
              ),
              PetCareButton(
                title: "Criar Conta",
                onTap: () => _controller.criarConta(
                  irHomeScreen,
                  showErrorToast,
                ),
              ),
            ],
          );
        });
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

  void showErrorToast() {
    showErrorToastMessage(
      message: _controller.errorMessage,
      titulo: "Opa! Algo deu errado.",
      context: context,
    );
  }

  void irHomeScreen() {
    NavigatorPC.pushAndRemoveUntil(
      context,
      HomePage(
        usuarioLogado: _controller.usuarioLogado!,
      ),
    );
  }
}
