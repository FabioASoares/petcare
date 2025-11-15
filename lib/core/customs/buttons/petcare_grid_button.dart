import 'package:flutter/material.dart';

class PetCareGridButton extends StatelessWidget {
  final List<Widget> buttons;
  final double spacing;
  const PetCareGridButton({
    super.key,
    required this.buttons,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: GridView.builder(
        itemCount: buttons.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: spacing,
        ),
        itemBuilder: (context, index) {
          return buttons[index];
        },
      ),
    );
  }
}
