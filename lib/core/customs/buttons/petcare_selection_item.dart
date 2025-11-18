import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_dropdown.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareSelectionItem extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final List<MapEntry<String, String>> items;
  final Function(MapEntry<String, String> selectedItem)?
      onPressedPositiveButton;
  final Color? colorDivider;
  final Color? selectedColor;
  final bool semiBold;
  final bool enable;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function() onSelectItem;

  final ValueNotifier<MapEntry<String, String>?> selectedItemNotifier;

  const PetCareSelectionItem({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItemNotifier,
    this.titleStyle,
    this.titleColor,
    this.onPressedPositiveButton,
    required this.onSelectItem,
    this.colorDivider,
    this.selectedColor,
    this.semiBold = true,
    this.enable = true,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: ColorsPC.cinza.x100, width: 1),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: PetCareText.h5(
            title,
            style: titleStyle,
            color: titleColor,
            paddings: const [4, 10, 0, 6],
          ),
        ),
        GestureDetector(
          onTap: enable ? () => onTapSelectItem(context) : null,
          child: ValueListenableBuilder<MapEntry<String, String>?>(
            valueListenable: selectedItemNotifier,
            builder: (_, selectedItem, __) {
              return TextField(
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      enable ? Colors.transparent : ColorsPC.system.disabled,
                  hintText: selectedItem?.value ?? "Selecione...",
                  hintStyle: TextStyle(color: ColorsPC.cinza.x300),
                  prefixIcon: prefixIcon != null
                      ? Icon(prefixIcon, color: ColorsPC.cinza.x300)
                      : null,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  enabledBorder: borderStyle,
                  disabledBorder: borderStyle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onTapSelectItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => PetCareDropDown(
        selectedColor: selectedColor ?? ColorsPC.turquesa.x450,
        items: items,
        title: title,
        onPressedPositiveButton: (itemSelecionado) {
          selectedItemNotifier.value = itemSelecionado;
          onPressedPositiveButton?.call(itemSelecionado);
          onSelectItem();
        },
      ),
    );
  }
}
