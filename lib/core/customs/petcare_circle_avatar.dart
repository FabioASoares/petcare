import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petcare/core/colors/petcare_colors.dart';

class PetCareCircleAvatar extends StatelessWidget {
  final File? file;
  final bool loadingState;
  const PetCareCircleAvatar({
    super.key,
    required this.loadingState,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: ColorsPC.turquesa.x50,
            backgroundImage: file != null
                ? FileImage(file!)
                : const AssetImage('assets/images/avatar_placeholder.png')
                    as ImageProvider,
          ),
          if (loadingState)
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: ColorsPC.turquesa.x600.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          if (loadingState)
            const SizedBox(
              width: 60,
              height: 60,
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
        ],
      ),
    );
  }
}
