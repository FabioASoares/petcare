import 'package:flutter/material.dart';
import 'package:petcenter/modules/formulario_exame/di/formulario_exame_module.dart';
import 'package:petcenter/modules/formulario_exame/state/formulario_exame_state.dart';

import 'formulario_exame_controller.dart';

class FormularioExamePage extends StatefulWidget {
  const FormularioExamePage({Key? key}) : super(key: key);

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
