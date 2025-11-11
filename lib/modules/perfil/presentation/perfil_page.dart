import 'package:flutter/material.dart';
import 'package:petcenter/modules/perfil/di/perfil_module.dart';
import 'package:petcenter/modules/perfil/state/perfil_state.dart';

import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late PerfilController _controller;

  @override
  void initState() {
    super.initState();

    PerfilModule.init();
    _controller = PerfilModule.getController();
  }

  @override
  void dispose() {
    PerfilModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: const Center(
        child: Text("Perfil"),
      ),
    );
  }
}
