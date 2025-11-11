import 'package:flutter/material.dart';

abstract class NavigatorPC {
  static Future<void> push(context, Widget widget) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
  }

  static Future<void> pushReplacement(context, Widget widget) async {
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => widget));
  }

  static Future<void> pushAndRemoveUntil(context, Widget widget) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
        (Route<dynamic> route) => false);
  }

  static void pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static Function(int)? _changePage;
  static Function(int) get changePage => _changePage ?? (page) {};
  static void setChangePage(Function(int) value) {
    _changePage = value;
  }
}
