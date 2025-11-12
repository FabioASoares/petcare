import 'package:flutter/material.dart';
import 'package:petcare/modules/agenda/di/agenda_module.dart';
import 'package:petcare/modules/agenda/state/agenda_state.dart';

import 'agenda_controller.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  late AgendaController _controller;

  @override
  void initState() {
    super.initState();

    AgendaModule.init();
    _controller = AgendaModule.getController();
  }

  @override
  void dispose() {
    AgendaModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda"),
      ),
      body: const Center(
        child: Text("Agenda"),
      ),
    );
  }
}
