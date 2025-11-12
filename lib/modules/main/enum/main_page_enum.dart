import 'package:flutter/material.dart';

enum MainPageEnum {
  home(
    Icons.fact_check_outlined,
    "Início",
  ),
  agendamento(
    Icons.medical_services,
    "Agendamento",
  ),
  meusPets(
    Icons.pets,
    "Meus Pets",
  ),
  profile(
    Icons.person_rounded,
    "Minha Conta",
  );

  final IconData iconData;
  final String label;

  const MainPageEnum(
    this.iconData,
    this.label,
  );
}
