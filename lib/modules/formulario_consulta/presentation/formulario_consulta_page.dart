import 'package:flutter/material.dart';
import 'package:petcare/modules/formulario_consulta/di/formulario_consulta_module.dart';

import 'formulario_consulta_controller.dart';

class FormularioConsultaPage extends StatefulWidget {
  const FormularioConsultaPage({super.key});

  @override
  State<FormularioConsultaPage> createState() => _FormularioConsultaPageState();
}

class _FormularioConsultaPageState extends State<FormularioConsultaPage> {
  late FormularioConsultaController _controller;

  @override
  void initState() {
    super.initState();

    FormularioConsultaModule.init();
    _controller = FormularioConsultaModule.getController();
  }

  @override
  void dispose() {
    FormularioConsultaModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormularioConsulta"),
      ),
      body: const Center(
        child: Text("FormularioConsulta"),
      ),
    );
  }
}
