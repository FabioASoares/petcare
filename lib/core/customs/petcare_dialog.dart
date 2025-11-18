import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/extension/double_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareDialog extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final Color? colorDivider;
  final MainAxisAlignment? titleAlignment;
  final MainAxisAlignment? childrenAlignment;
  final Widget body;
  final String? textPositiveButton;
  final String? textNegativeButton;
  final Function()? onPressedPositiveButton;
  final Function()? onPressedNegativeButton;
  final List<double> childrenPaddings;
  final Widget? customPositiveButton;
  final bool enablePositiveButton;

  const PetCareDialog({
    super.key,
    required this.body,
    this.title,
    this.titleStyle,
    this.colorDivider,
    this.titleAlignment,
    this.childrenAlignment,
    this.textPositiveButton,
    this.textNegativeButton,
    this.onPressedPositiveButton,
    this.onPressedNegativeButton,
    this.icon,
    this.childrenPaddings = const [0, 0, 0, 0],
    this.iconColor,
    this.customPositiveButton,
    this.enablePositiveButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: ColorsPC.system.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: titleAlignment ?? MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: icon != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      icon,
                      color: iconColor ?? ColorsPC.turquesa.x450,
                    ),
                  ),
                ),
                Visibility(
                  visible: title != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: PetCareText.h6(
                      title ?? "",
                      style: titleStyle,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Divider(
                thickness: 3,
                color: colorDivider ?? ColorsPC.turquesa.x450,
              ),
            ),
            Column(
              mainAxisAlignment: childrenAlignment ?? MainAxisAlignment.center,
              children: [
                Padding(
                  padding: childrenPaddings.toEdgeInsetsFromLTRB(),
                  child: body,
                ),
                Row(
                  children: [
                    if (textNegativeButton != null)
                      Expanded(
                        child: PetCareButton(
                          borderRadius: 20,
                          title: textNegativeButton ?? "Cancelar",
                          buttonColor: ColorsPC.system.pureWhite,
                          colors: ColorsPC.turquesa.x450,
                          onTap: () {
                            Navigator.pop(context);
                            if (onPressedNegativeButton != null) {
                              onPressedNegativeButton!();
                            }
                          },
                        ),
                      ),
                    Visibility(
                      visible: getSizedBox(),
                      child: const SizedBox(
                        width: 20,
                      ),
                    ),
                    if (customPositiveButton != null)
                      Expanded(child: customPositiveButton!),
                    if (textPositiveButton != null)
                      Expanded(
                        child: PetCareButton(
                          borderRadius: 20,
                          enable: enablePositiveButton,
                          title: textPositiveButton ?? "Confirmar",
                          buttonColor: enablePositiveButton
                              ? ColorsPC.turquesa.x450
                              : null,
                          onTap: () {
                            Navigator.pop(context);
                            if (onPressedPositiveButton != null) {
                              onPressedPositiveButton!();
                            }
                          },
                        ),
                      )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  factory PetCareDialog.withMessage({
    required String messageBody,
    String? textPositiveButton,
    String? textNegativeButton,
    Function()? onPressedPositiveButton,
    Function()? onPressedNegativeButton,
    Color? colorDivider,
    String? title,
    IconData? icon,
    Color? iconColor,
    TextStyle? titleStyle,
    TextStyle? messageBodyStyle,
    Alignment? messageBodyAlignment,
    MainAxisAlignment? titleAlignment,
    List<double> childPaddings = const [0, 0, 0, 0],
  }) {
    return PetCareDialog(
      childrenPaddings: childPaddings,
      title: title,
      icon: icon,
      iconColor: iconColor,
      titleStyle: titleStyle,
      colorDivider: colorDivider,
      titleAlignment: titleAlignment,
      textPositiveButton: textPositiveButton,
      textNegativeButton: textNegativeButton,
      onPressedNegativeButton: onPressedNegativeButton,
      onPressedPositiveButton: onPressedPositiveButton,
      body: Align(
        alignment: messageBodyAlignment ?? Alignment.centerLeft,
        child: PetCareText.body1(
          messageBody,
          style: messageBodyStyle,
        ),
      ),
    );
  }

  factory PetCareDialog.withWidgetList({
    required List<Widget> body,
    String? textPositiveButton,
    String? textNegativeButton,
    Function()? onPressedPositiveButton,
    Function()? onPressedNegativeButton,
    Color? colorDivider,
    String? title,
    IconData? icon,
    Color? iconColor,
    TextStyle? titleStyle,
    TextStyle? messageBodyStyle,
    MainAxisAlignment? titleAlignment,
    MainAxisAlignment? childrenMainAlignment,
    CrossAxisAlignment? childrenCrossAlignment,
    List<double> childPaddings = const [0, 0, 0, 0],
  }) {
    return PetCareDialog(
      title: title,
      childrenPaddings: childPaddings,
      icon: icon,
      iconColor: iconColor,
      titleStyle: titleStyle,
      colorDivider: colorDivider,
      titleAlignment: titleAlignment,
      textPositiveButton: textPositiveButton,
      textNegativeButton: textNegativeButton,
      onPressedNegativeButton: onPressedNegativeButton,
      onPressedPositiveButton: onPressedPositiveButton,
      body: Column(
        mainAxisAlignment: childrenMainAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: childrenCrossAlignment ?? CrossAxisAlignment.start,
        children: body,
      ),
    );
  }

  bool getSizedBox() {
    return textNegativeButton != null && textPositiveButton != null;
  }
}
