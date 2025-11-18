import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';

class PetCareSelectedItem extends StatelessWidget {
  final String descricao;
  final String id;
  final Function() onSelectedItem;
  final bool showDivider;
  final bool isSelected;
  final Color? selectedColor;

  const PetCareSelectedItem({
    super.key,
    required this.descricao,
    required this.id,
    required this.onSelectedItem,
    required this.showDivider,
    required this.isSelected,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: GestureDetector(
        onTap: onSelectedItem,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected
                ? selectedDefaultColor()
                : ColorsPC.system.background,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  descricao,
                  style: TextStyle(
                    color: isSelected
                        ? ColorsPC.system.pureWhite
                        : ColorsPC.cinza.x600,
                    fontWeight: isSelected ? FontWeight.w500 : null,
                    fontSize: isSelected ? 15 : 14,
                  ),
                ),
              ),
              if (isSelected)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.check_box,
                    color: ColorsPC.system.pureWhite,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color selectedDefaultColor() {
    return selectedColor ?? ColorsPC.turquesa.x450;
  }
}
