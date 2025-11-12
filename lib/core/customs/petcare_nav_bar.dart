import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petcare/core/colors/petcare_colors.dart';

class PetCareNavBar extends StatelessWidget {
  final int pageSelected;
  final Function(int) destinationSelected;
  final List<GButton> tabs;
  const PetCareNavBar({
    super.key,
    required this.pageSelected,
    required this.destinationSelected,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      activeColor: ColorsPC.turquesa.x550,
      color: ColorsPC.cinza.x250,
      tabBackgroundColor: ColorsPC.turquesa.x350.withOpacity(0.1),
      gap: 8,
      curve: Curves.easeInCirc,
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
      tabMargin: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      tabs: tabs,
      backgroundColor: ColorsPC.system.background,
      onTabChange: destinationSelected,
      selectedIndex: pageSelected,
    );
  }
}
