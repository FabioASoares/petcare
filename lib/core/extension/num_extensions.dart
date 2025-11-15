import 'package:flutter/widgets.dart';

extension SizeExtensions on num {
  double get w =>
      MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.first,
      ).size.width *
      this;

  double get h =>
      MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.first,
      ).size.height *
      this;
}
