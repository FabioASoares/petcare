import 'package:flutter/material.dart';
import 'package:petcare/modules/informacoes_pet/di/informacoes_pet_module.dart';
import 'package:petcare/modules/pets/domain/entities/pet_entity.dart';

import 'informacoes_pet_controller.dart';

class InformacoesPetPage extends StatefulWidget {
  final PetEntity informacoesPet;
  const InformacoesPetPage({
    super.key,
    required this.informacoesPet,
  });

  @override
  State<InformacoesPetPage> createState() => _InformacoesPetPageState();
}

class _InformacoesPetPageState extends State<InformacoesPetPage> {
  late InformacoesPetController _controller;

  @override
  void initState() {
    super.initState();

    InformacoesPetModule.init();
    _controller = InformacoesPetModule.getController();
  }

  @override
  void dispose() {
    InformacoesPetModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.informacoesPet.nomePet),
      ),
      body: const Center(
        child: Text("InformacoesPet"),
      ),
    );
  }
}
