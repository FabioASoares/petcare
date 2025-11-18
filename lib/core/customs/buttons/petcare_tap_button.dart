import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/enums/tap_selection_enum.dart';
import 'package:petcare/core/extension/double_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareTapButton extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final String firstButtonName;
  final String secondButtonName;
  final Function() onTapFirstButton;
  final Function() onTapSecondButton;
  final TapSelectionEnum selection;
  final List<double> paddings;
  final double? height;
  const PetCareTapButton({
    super.key,
    required this.label,
    this.labelStyle,
    required this.firstButtonName,
    required this.secondButtonName,
    required this.onTapFirstButton,
    required this.onTapSecondButton,
    required this.selection,
    this.paddings = const [0, 0, 0, 0],
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.toEdgeInsetsFromLTRB(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PetCareText.h5(
            label,
            style: labelStyle,
            paddings: const [4, 0, 0, 6],
          ),
          Row(
            children: [
              Expanded(
                child: PetCareButton(
                  title: firstButtonName,
                  onTap: onTapFirstButton,
                  colors: titleColor(selected: true),
                  buttonColor: backgroundColor(selected: true),
                  borderColor: borderColor(selected: true),
                  borderRadius: 16,
                  height: height,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PetCareButton(
                  title: secondButtonName,
                  onTap: onTapSecondButton,
                  colors: titleColor(selected: false),
                  buttonColor: backgroundColor(selected: false),
                  borderColor: borderColor(selected: false),
                  borderRadius: 16,
                  height: height,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color backgroundColor({required bool selected}) {
    switch (selection) {
      case TapSelectionEnum.sim:
        return selected ? ColorsPC.turquesa.x450 : ColorsPC.system.pureWhite;
      case TapSelectionEnum.nao:
        return selected ? ColorsPC.system.pureWhite : ColorsPC.turquesa.x450;
      default:
        return ColorsPC.system.pureWhite;
    }
  }

  Color borderColor({required bool selected}) {
    switch (selection) {
      case TapSelectionEnum.sim:
        return selected ? ColorsPC.system.pureWhite : ColorsPC.cinza.x200;
      case TapSelectionEnum.nao:
        return selected ? ColorsPC.cinza.x200 : ColorsPC.system.pureWhite;
      default:
        return ColorsPC.cinza.x200;
    }
  }

  Color titleColor({required bool selected}) {
    switch (selection) {
      case TapSelectionEnum.sim:
        return selected ? ColorsPC.system.pureWhite : ColorsPC.cinza.x500;
      case TapSelectionEnum.nao:
        return selected ? ColorsPC.cinza.x500 : ColorsPC.system.pureWhite;
      case TapSelectionEnum.neutro:
        return ColorsPC.cinza.x500;
    }
  }
}
