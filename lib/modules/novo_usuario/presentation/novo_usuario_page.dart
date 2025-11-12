import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/helper/image_helper.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/novo_usuario/di/novo_usuario_module.dart';

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

  File? _imagemPerfil;

  @override
  Widget build(BuildContext context) {
    return PetCareScaffold(
      isLoading: false,
      appBar: AppBar(
        backgroundColor: ColorsPC.system.background,
        centerTitle: true,
        title: const Text(
          "Criar Conta",
          textAlign: TextAlign.center,
        ),
      ),
      body: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: ColorsPC.turquesa.x50,
            backgroundImage: _imagemPerfil != null
                ? FileImage(_imagemPerfil!)
                : const AssetImage('assets/images/avatar_placeholder.png')
                    as ImageProvider,
          ),
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
        )
      ],
    );
  }

  Future<void> _selecionarImagem() async {
    final imagemSelecionada = await ImageHelper.abrirGaleriaComLocalizacao();

    if (imagemSelecionada != null) {
      setState(() {
        _imagemPerfil = imagemSelecionada.file;
      });
    }
  }
}
