import 'package:flutter/material.dart';

extension PaddingListExtension on List<double>? {
  EdgeInsets toEdgeInsetsFromLTRB() {
    final list = (this ?? []).followedBy(List.filled(4, 0.0)).take(4).toList();
    return EdgeInsets.fromLTRB(list[0], list[1], list[2], list[3]);
  }
}

extension FontSizeExtension on double {
  double adaptFont(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const baseWidth = 375.0;
    const baseHeight = 812.0;

    final scaleW = size.width / baseWidth;
    final scaleH = size.height / baseHeight;

    final scale = (scaleW + scaleH) / 2;

    return this * scale;
  }
}
