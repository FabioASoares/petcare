import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/modules/agenda/di/agenda_module.dart';

import 'agenda_controller.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

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
    return PetCareScaffold(
      isLoading: false,
      appBar: AppBar(
        backgroundColor: ColorsPC.system.background,
        title: const Text("Agenda"),
      ),
      body: const [
        Center(
          child: Text("Agenda"),
        ),
      ],
    );
  }
}
