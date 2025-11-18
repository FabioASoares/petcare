import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/extension/double_extensions.dart';

class PetCareButton extends StatelessWidget {
  final bool iconOnTheLeft;
  final bool iconOnTheRight;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String title;
  final Function() onTap;
  final Color? buttonColor;
  final Color? colors;
  final List<double> paddings;
  final Color? borderColor;
  final bool enable;
  final double? borderRadius;
  final double? spacingLeftIcon;
  final double? spacingRightIcon;
  final double? height;

  final double? iconRotation;

  const PetCareButton({
    super.key,
    required this.title,
    required this.onTap,
    this.iconOnTheLeft = false,
    this.iconOnTheRight = false,
    this.buttonColor,
    this.colors,
    this.leftIcon,
    this.rightIcon,
    this.paddings = const [0, 0, 0, 0],
    this.borderColor,
    this.enable = true,
    this.borderRadius,
    this.iconRotation,
    this.spacingLeftIcon = 10,
    this.spacingRightIcon = 10,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.toEdgeInsetsFromLTRB(),
      child: GestureDetector(
        onTap: enable ? onTap : () {},
        child: Container(
          height: height ?? 60,
          decoration: BoxDecoration(
            color: buttonColor ?? colorButton(),
            borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
            border: Border.all(
              color: borderColor ?? ColorsPC.system.background,
              width: borderRadius == null ? 1.5 : 0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconOnTheLeft && leftIcon != null)
                Transform.rotate(
                  angle: (iconRotation ?? 0) * math.pi / 180,
                  child: Icon(
                    leftIcon,
                    color: colors,
                  ),
                ),
              SizedBox(width: spacingLeftIcon),
              Text(
                title,
                style: TextStyle(
                  color: colorText(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: spacingRightIcon),
              if (iconOnTheRight && rightIcon != null)
                Transform.rotate(
                  angle: (iconRotation ?? 0) * math.pi / 180,
                  child: Icon(
                    rightIcon,
                    color: colors,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color colorButton() {
    return enable ? ColorsPC.turquesa.x400 : ColorsPC.system.disabled;
  }

  Color colorText() {
    return enable
        ? (colors ?? ColorsPC.system.background)
        : ColorsPC.system.labelText;
  }
}
