import 'package:flutter/material.dart';
import 'package:petcare/modules/agenda/presentation/agenda_page.dart';
import 'package:petcare/modules/home/presentation/home_page.dart';
import 'package:petcare/modules/main/enum/main_page_enum.dart';
import 'package:petcare/modules/perfil/presentation/perfil_page.dart';
import 'package:petcare/modules/pets/presentation/pets_page.dart';

abstract class MainUseCase {
  Widget getMainPage(MainPageEnum e);
}

class MainUseCaseImpl implements MainUseCase {
  @override
  Widget getMainPage(MainPageEnum e) {
    switch (e) {
      case MainPageEnum.home:
        return const HomePage();
      case MainPageEnum.agendamento:
        return const AgendaPage();
      case MainPageEnum.meusPets:
        return const PetsPage();
      case MainPageEnum.profile:
        return const PerfilPage();
    }
  }
}
