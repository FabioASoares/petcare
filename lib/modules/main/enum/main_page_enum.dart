import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; // ou FontAwesome

enum MainPageEnum {
  home("Central"),
  agendamento("Agendamento"),
  meusPets("Meus Pets"),
  profile("Minha Conta");

  final String label;
  const MainPageEnum(this.label);

  IconData get iconData {
    switch (this) {
      case MainPageEnum.home:
        return MdiIcons.paw;
      case MainPageEnum.agendamento:
        return Icons.edit_calendar;
      case MainPageEnum.meusPets:
        return MdiIcons.dogSide;
      case MainPageEnum.profile:
        return MdiIcons.accountCogOutline;
    }
  }
}
