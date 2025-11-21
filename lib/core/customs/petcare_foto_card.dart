import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:petcare/core/extension/double_extensions.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/extension/string_extensions.dart';

class PetCareFotoCard extends StatelessWidget {
  final String asset;
  final double radius;
  final List<double> paddings;
  const PetCareFotoCard({
    super.key,
    required this.asset,
    this.radius = 18,
    this.paddings = const [0, 0, 0, 0],
  });

  @override
  Widget build(BuildContext context) {
    Uint8List base64String = asset.imageFromBase64String;
    return Padding(
      padding: paddings.toEdgeInsetsFromLTRB(),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.memory(
            base64String,
            fit: BoxFit.cover,
            width: 0.18.w,
            height: 0.18.w,
          ),
        ),
      ),
    );
  }
}
