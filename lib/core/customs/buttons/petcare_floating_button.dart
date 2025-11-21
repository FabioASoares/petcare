import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';

class PetCareFloatingButton extends StatelessWidget {
  final Function() onTap;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  const PetCareFloatingButton({
    super.key,
    required this.onTap,
    this.color,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: onTap,
      backgroundColor: color ?? ColorsPC.turquesa.x450,
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        0,
      ),
      child: Icon(
        icon ?? Icons.add,
        color: iconColor ?? ColorsPC.system.pureWhite,
      ),
    );
  }
}
