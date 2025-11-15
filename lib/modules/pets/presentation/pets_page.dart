import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/modules/pets/di/pets_module.dart';

import 'pets_controller.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({super.key});

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
    return PetCareScaffold(
      isLoading: false,
      appBar: AppBar(
        backgroundColor: ColorsPC.system.background,
        title: const Text("Meus Pets"),
      ),
      body: const [
        Center(
          child: Text("Meus Pets"),
        ),
      ],
    );
  }
}
