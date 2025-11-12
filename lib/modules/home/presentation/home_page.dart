import 'package:flutter/material.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/modules/home/di/home_module.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();

    HomeModule.init();
    _controller = HomeModule.getController();
  }

  @override
  void dispose() {
    HomeModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const PetCareScaffold(
      isLoading: false,
      body: [
        Center(
          child: Text("Home"),
        ),
      ],
    );
  }
}
