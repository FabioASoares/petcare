import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareCard extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final List<Widget> body;
  final double radius;
  final Color? backgroundCardColor;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final bool divider;
  final Color? colorDivider;
  final Color? titleColor;
  final CrossAxisAlignment bodyCrossAlignment;
  final MainAxisAlignment bodyMainAlignment;
  final EdgeInsetsGeometry paddingOutside;
  final EdgeInsetsGeometry paddingInside;
  const PetCareCard({
    super.key,
    this.title = '',
    this.titleStyle,
    this.leftIcon,
    this.rightIcon,
    required this.body,
    this.backgroundCardColor,
    this.leftIconColor,
    this.radius = 10,
    this.rightIconColor,
    this.divider = false,
    this.colorDivider,
    this.titleColor,
    this.bodyCrossAlignment = CrossAxisAlignment.start,
    this.bodyMainAlignment = MainAxisAlignment.start,
    this.paddingOutside = const EdgeInsets.all(0),
    this.paddingInside = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingOutside,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundCardColor ?? ColorsPC.system.pureWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (leftIcon != null)
                    Icon(
                      leftIcon,
                      color: leftIconColor,
                    ),
                  Expanded(
                    child: PetCareText.h5(
                      title,
                      color: titleColor,
                      paddings: const [20, 10, 0, 0],
                      align: TextAlign.left,
                    ),
                  ),
                  if (rightIcon != null)
                    Icon(
                      rightIcon,
                      color: rightIconColor,
                    ),
                ],
              ),
              if (divider)
                Divider(
                  thickness: 1,
                  color: colorDivider,
                ),
              Padding(
                padding: paddingInside,
                child: Column(
                  crossAxisAlignment: bodyCrossAlignment,
                  mainAxisAlignment: bodyMainAlignment,
                  children: body,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
