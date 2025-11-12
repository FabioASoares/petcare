import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_estetica/di/formulario_estetica_module.dart';

import 'formulario_estetica_controller.dart';

class FormularioEsteticaPage extends StatefulWidget {
  const FormularioEsteticaPage({super.key});

  @override
  State<FormularioEsteticaPage> createState() => _FormularioEsteticaPageState();
}

class _FormularioEsteticaPageState extends State<FormularioEsteticaPage> {
  late FormularioEsteticaController _controller;

  @override
  void initState() {
    super.initState();

    FormularioEsteticaModule.init();
    _controller = FormularioEsteticaModule.getController();
  }

  @override
  void dispose() {
    FormularioEsteticaModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormularioEstetica"),
      ),
      body: const Center(
        child: Text("FormularioEstetica"),
      ),
    );
  }
}
