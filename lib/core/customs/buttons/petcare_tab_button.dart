import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareTabButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String subtitle;
  final String description;
  final Widget rightWidget;
  final IconData? icon;
  final File? image;
  final Color? backgroundIconColor;
  final Color? iconColor;
  const PetCareTabButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.rightWidget,
    this.icon,
    this.image,
    this.backgroundIconColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.08.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsPC.system.pureWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: backgroundIconColor ??
                    ColorsPC.turquesa.x150.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: icon != null
                    ? Icon(
                        icon,
                        color: ColorsPC.turquesa.x500,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(image!),
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PetCareText.h6(
                    title,
                    color: ColorsPC.cinza.x500,
                    paddings: const [10, 0, 0, 0],
                  ),
                  PetCareText.body3(
                    "$subtitle | $description",
                    color: ColorsPC.cinza.x500,
                    paddings: const [10, 0, 0, 0],
                  ),
                ],
              ),
            ),
            rightWidget,
          ],
        ),
      ),
    );
  }
}
