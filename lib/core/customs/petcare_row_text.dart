import 'package:flutter/material.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareRowText extends StatelessWidget {
  final String title;
  final String lable;
  final IconData leftIcon;
  final IconData? rightIcon;
  final Color iconColor;
  final bool showDivider;
  const PetCareRowText({
    super.key,
    required this.title,
    required this.lable,
    required this.leftIcon,
    this.rightIcon,
    required this.iconColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                leftIcon,
                color: iconColor,
              ),
              Expanded(
                child: Row(
                  children: [
                    PetCareText.h6(
                      title,
                      semiBold: true,
                      paddings: [0.01.h, 0, 0.005.h, 0],
                    ),
                    PetCareText.h6(
                      lable,
                    ),
                  ],
                ),
              ),
              if (rightIcon != null)
                Icon(
                  rightIcon,
                  color: iconColor,
                ),
            ],
          ),
          if (showDivider)
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
        ],
      ),
    );
  }
}
