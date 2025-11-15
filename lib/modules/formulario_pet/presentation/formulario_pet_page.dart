import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/customs/textfields/petcare_textfield.dart';
import 'package:petcare/modules/formulario_pet/di/formulario_pet_module.dart';
import 'package:petcare/modules/formulario_pet/presentation/components/petcare_card_foto.dart';

import 'formulario_pet_controller.dart';

class FormularioPetPage extends StatefulWidget {
  const FormularioPetPage({super.key});

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
  }

  @override
  void dispose() {
    FormularioPetModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PetCareScaffold(
      isLoading: false,
      appBar: AppBar(
        backgroundColor: ColorsPC.system.background,
        centerTitle: true,
        title: const Text("Cadastro de Novo Pet"),
      ),
      body: [
        PetCareCardFoto(
          onTap: () {},
          isLoadingFoto: false,
        ),
        const PetCareTextField(
          title: "Nome do Tutor",
        ),
      ],
    );
  }
}
