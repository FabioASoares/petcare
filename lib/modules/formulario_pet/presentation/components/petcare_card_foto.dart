import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_circle_avatar.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

class PetCareCardFoto extends StatelessWidget {
  final Function() onTap;
  final bool isLoadingFoto;
  final File? foto;
  const PetCareCardFoto({
    super.key,
    required this.onTap,
    required this.isLoadingFoto,
    this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.24.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsPC.azul.x150.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PetCareCircleAvatar(
              loadingState: isLoadingFoto,
              file: foto,
            ),
            PetCareText.h5(
              "Foto do seu Amigo Pet",
              paddings: const [0, 20, 0, 0],
            ),
            PetCareText.body2("Clique para inserir uma foto"),
          ],
        ),
      ),
    );
  }
}
