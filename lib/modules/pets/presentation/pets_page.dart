import 'package:flutter/material.dart';
import 'package:petcenter/modules/pets/di/pets_module.dart';
import 'package:petcenter/modules/pets/state/pets_state.dart';

import 'pets_controller.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  late PetsController _controller;

  @override
  void initState() {
    super.initState();

    PetsModule.init();
    _controller = PetsModule.getController();
  }

  @override
  void dispose() {
    PetsModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pets"),
      ),
      body: const Center(
        child: Text("Pets"),
      ),
    );
  }
}
