import 'package:flutter/material.dart';
import 'package:petcenter/modules/agendar/di/agendar_module.dart';
import 'package:petcenter/modules/agendar/state/agendar_state.dart';

import 'agendar_controller.dart';

class AgendarPage extends StatefulWidget {
  const AgendarPage({Key? key}) : super(key: key);

  @override
  State<AgendarPage> createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {
  late AgendarController _controller;

  @override
  void initState() {
    super.initState();

    AgendarModule.init();
    _controller = AgendarModule.getController();
  }

  @override
  void dispose() {
    AgendarModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendar"),
      ),
      body: const Center(
        child: Text("Agendar"),
      ),
    );
  }
}
