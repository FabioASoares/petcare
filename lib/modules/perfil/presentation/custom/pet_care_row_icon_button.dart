import 'package:flutter/material.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareRowIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color? backgroundIconColor;
  final Function() onTap;
  final bool showDivider;
  const PetCareRowIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.backgroundIconColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: backgroundIconColor ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              Expanded(
                child: PetCareText.h6(
                  title,
                  align: TextAlign.left,
                  paddings: [0.02.h, 0, 0, 0],
                ),
              ),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                ),
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
