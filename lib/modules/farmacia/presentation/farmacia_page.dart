import 'package:flutter/material.dart';
import 'package:petcenter/modules/farmacia/di/farmacia_module.dart';
import 'package:petcenter/modules/farmacia/state/farmacia_state.dart';

import 'farmacia_controller.dart';

class FarmaciaPage extends StatefulWidget {
  const FarmaciaPage({Key? key}) : super(key: key);

  @override
  State<FarmaciaPage> createState() => _FarmaciaPageState();
}

class _FarmaciaPageState extends State<FarmaciaPage> {
  late FarmaciaController _controller;

  @override
  void initState() {
    super.initState();

    FarmaciaModule.init();
    _controller = FarmaciaModule.getController();
  }

  @override
  void dispose() {
    FarmaciaModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmacia"),
      ),
      body: const Center(
        child: Text("Farmacia"),
      ),
    );
  }
}
