import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_exame/di/formulario_exame_module.dart';

import 'formulario_exame_controller.dart';

class FormularioExamePage extends StatefulWidget {
  const FormularioExamePage({super.key});

  @override
  State<FormularioExamePage> createState() => _FormularioExamePageState();
}

class _FormularioExamePageState extends State<FormularioExamePage> {
  late FormularioExameController _controller;

  @override
  void initState() {
    super.initState();

    FormularioExameModule.init();
    _controller = FormularioExameModule.getController();
  }

  @override
  void dispose() {
    FormularioExameModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormularioExame"),
      ),
      body: const Center(
        child: Text("FormularioExame"),
      ),
    );
  }
}
