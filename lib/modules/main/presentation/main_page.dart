import 'package:flutter/material.dart';
import 'package:petcare/core/customs/petcare_nav_bar.dart';
import 'package:petcare/modules/main/di/main_module.dart';
import 'package:petcare/modules/main/presentation/main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainController _controller;

  @override
  void initState() {
    super.initState();

    MainModule.init();
    _controller = MainModule.getController();
  }

  @override
  void dispose() {
    MainModule.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    try {
      final key = _controller.currentNavigatorKey;
      if (key == null || key.currentState == null) {
        return false;
      }
      if (key.currentState!.canPop()) {
        Navigator.pop(key.currentContext!);
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (a) => onWillPop(),
      child: ValueListenableBuilder(
        valueListenable: _controller.pageSelected,
        builder: (_, pageSelected, __) {
          return Scaffold(
            body: Builder(
              builder: (_) {
                return Stack(
                  children: _controller.getMainPages,
                );
              },
            ),
            bottomNavigationBar: PetCareNavBar(
              pageSelected: pageSelected.index,
              destinationSelected: (value) {
                _controller.onDestinationSelected(value);
              },
              tabs: _controller.getMainButtons,
            ),
          );
        },
      ),
    );
  }
}
