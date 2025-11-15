import 'package:flutter/material.dart';
import 'package:petcare/modules/vacinacao/di/vacinacao_module.dart';
import 'package:petcare/modules/vacinacao/state/vacinacao_state.dart';

import 'vacinacao_controller.dart';

class VacinacaoPage extends StatefulWidget {
  const VacinacaoPage({Key? key}) : super(key: key);

  @override
  State<VacinacaoPage> createState() => _VacinacaoPageState();
}

class _VacinacaoPageState extends State<VacinacaoPage> {
  late VacinacaoController _controller;

  @override
  void initState() {
    super.initState();

    VacinacaoModule.init();
    _controller = VacinacaoModule.getController();
  }

  @override
  void dispose() {
    VacinacaoModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vacinacao"),
      ),
      body: const Center(
        child: Text("Vacinacao"),
      ),
    );
  }
}
