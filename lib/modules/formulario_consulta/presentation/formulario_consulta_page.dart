import 'package:flutter/material.dart';
import 'package:petcenter/modules/formulario_consulta/di/formulario_consulta_module.dart';
import 'package:petcenter/modules/formulario_consulta/state/formulario_consulta_state.dart';

import 'formulario_consulta_controller.dart';

class FormularioConsultaPage extends StatefulWidget {
  const FormularioConsultaPage({Key? key}) : super(key: key);

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
