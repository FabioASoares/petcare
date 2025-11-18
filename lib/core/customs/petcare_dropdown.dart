import 'package:flutter/material.dart';
import 'package:petcare/core/customs/petcare_dialog.dart';
import 'package:petcare/core/customs/petcare_selected_item.dart';

class PetCareDropDown extends StatelessWidget {
  final List<MapEntry<String, String>> items;
  final String title;
  final Function(MapEntry<String, String> selectedItem)?
      onPressedPositiveButton;
  final Color? colorDivider;
  final Color? selectedColor;

  PetCareDropDown({
    super.key,
    required this.items,
    required this.title,
    required this.onPressedPositiveButton,
    this.colorDivider,
    this.selectedColor,
  });

  final ValueNotifier<MapEntry<String, String>?> _selectedItem =
      ValueNotifier<MapEntry<String, String>?>(null);

  @override
  Widget build(BuildContext context) {
    return PetCareDialog.withWidgetList(
      title: title,
      textPositiveButton: "Confirmar",
      textNegativeButton: "Cancelar",
      colorDivider: colorDivider,
      onPressedPositiveButton: () {
        if (_selectedItem.value != null && onPressedPositiveButton != null) {
          onPressedPositiveButton!(_selectedItem.value!);
        }
      },
      body: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ValueListenableBuilder<MapEntry<String, String>?>(
            valueListenable: _selectedItem,
            builder: (_, selected, __) {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];
                  return PetCareSelectedItem(
                    descricao: item.value,
                    id: item.key,
                    showDivider: index != 0,
                    isSelected: selected?.key == item.key,
                    selectedColor: selectedColor,
                    onSelectedItem: () {
                      _selectedItem.value = item;
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
