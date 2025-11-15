import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/helper/petcare_text.dart';

enum PetCareCardButtonType {
  titleInside,
  titleOutside,
}

class PetCareCardButton extends StatelessWidget {
  final IconData? icon;
  final File? asset;
  final String title;
  final Function() onTap;
  final BoxDecoration? decoration;
  final Color? backgroundColor;
  final Color? iconColor;
  final double radius;
  final PetCareCardButtonType type;

  const PetCareCardButton._({
    super.key,
    required this.title,
    required this.onTap,
    required this.type,
    this.icon,
    this.asset,
    this.decoration,
    this.backgroundColor,
    this.iconColor,
    this.radius = 18,
  });

  factory PetCareCardButton.inside({
    Key? key,
    IconData? icon,
    File? asset,
    required String title,
    required Function() onTap,
    BoxDecoration? decoration,
    Color? backgroundColor,
    Color? iconColor,
    double radius = 18,
  }) {
    return PetCareCardButton._(
      key: key,
      title: title,
      onTap: onTap,
      icon: icon,
      asset: asset,
      decoration: decoration,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      radius: radius,
      type: PetCareCardButtonType.titleInside,
    );
  }

  factory PetCareCardButton.outside({
    Key? key,
    IconData? icon,
    File? asset,
    required String title,
    required Function() onTap,
    BoxDecoration? decoration,
    Color? backgroundColor,
    Color? iconColor,
    double radius = 18,
  }) {
    return PetCareCardButton._(
      key: key,
      title: title,
      onTap: onTap,
      icon: icon,
      asset: asset,
      decoration: decoration,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      radius: radius,
      type: PetCareCardButtonType.titleOutside,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double w = 80;
    const double h = 80;

    final card = Container(
      width: w,
      height: h,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor ?? ColorsPC.system.pureWhite,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 36,
              color: iconColor ?? ColorsPC.turquesa.x350,
            ),
          if (asset != null && icon == null)
            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.file(
                asset!,
                width: w * 1,
                height: h * 1,
                fit: BoxFit.cover,
              ),
            ),
          if (type == PetCareCardButtonType.titleInside) ...[
            const SizedBox(height: 10),
            PetCareText.h6(
              title,
              color: ColorsPC.cinza.x600,
            ),
          ],
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: type == PetCareCardButtonType.titleInside
          ? ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: w,
                minHeight: h,
              ),
              child: card,
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: w,
                    minHeight: h,
                    maxWidth: w,
                    maxHeight: h,
                  ),
                  child: card,
                ),
                const SizedBox(height: 4),
                PetCareText.h6(
                  title,
                  color: ColorsPC.cinza.x600,
                ),
              ],
            ),
    );
  }
}
