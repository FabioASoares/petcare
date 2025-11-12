import 'package:flutter/material.dart';
import 'package:petcare/modules/historico/di/historico_module.dart';

import 'historico_controller.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late HistoricoController _controller;

  @override
  void initState() {
    super.initState();

    HistoricoModule.init();
    _controller = HistoricoModule.getController();
  }

  @override
  void dispose() {
    HistoricoModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historico"),
      ),
      body: const Center(
        child: Text("Historico"),
      ),
    );
  }
}
