import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petcare/core/extension/double_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareTextButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool withIcon;
  final IconData? icon;
  final Color? iconColor;
  final void Function() onTap;
  final MainAxisAlignment mainAxisAlignment;
  final List<double> paddings;
  final bool italic;
  final TextStyle? style;
  final TextAlign? align;
  const PetCareTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.withIcon = false,
    this.iconColor,
    this.titleColor,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.paddings = const [0, 0, 0, 0],
    this.italic = false,
    this.style,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.toEdgeInsetsFromLTRB(),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            const SizedBox(width: 10),
            PetCareText.h6(
              title,
              italic: italic,
              align: align,
              style: style ??
                  TextStyle(
                    color: titleColor ?? iconColor,
                    fontWeight: FontWeight.bold,
                    decorationColor: titleColor ?? iconColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
