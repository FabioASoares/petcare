import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareTextField extends StatelessWidget {
  final String? title;
  final String? placeholder;
  final TextEditingController controller;
  final bool enable;
  final Color? titleColor;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final double topPadding;
  const PetCareTextField({
    super.key,
    this.title,
    this.placeholder,
    required this.controller,
    this.enable = true,
    this.titleColor,
    this.leftIcon,
    this.rightIcon,
    this.leftIconColor,
    this.rightIconColor,
    this.topPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null)
          PetCareText.h5(
            title!,
            color: titleColor,
            paddings: [4, topPadding, 0, 6],
          ),
        TextFormField(
          controller: controller,
          enabled: enable,
          decoration: _getDecoration(),
        )
      ],
    );
  }

  InputDecoration _getDecoration() {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: ColorsPC.cinza.x100, width: 1),
    );
    final disableColor = ColorsPC.cinza.x100;
    final enableColor = ColorsPC.system.pureWhite;
    return InputDecoration(
      filled: true,
      enabledBorder: border,
      disabledBorder: border,
      hintText: placeholder,
      hintStyle: TextStyle(
        color: ColorsPC.cinza.x300,
      ),
      fillColor: enable ? enableColor : disableColor,
      prefixIcon:
          leftIcon != null ? Icon(leftIcon, color: leftIconColor) : null,
      suffixIcon:
          rightIcon != null ? Icon(rightIcon, color: rightIconColor) : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorsPC.turquesa.x400, width: 3),
      ),
    );
  }
}
