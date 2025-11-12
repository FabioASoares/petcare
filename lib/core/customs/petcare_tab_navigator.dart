import 'package:flutter/material.dart';

class PetCareTabNavigator extends StatefulWidget {
  const PetCareTabNavigator({
    super.key,
    required this.navigatorKey,
    required this.page,
  });
  final Widget page;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<PetCareTabNavigator> createState() => _PetCareTabNavigatorState();
}

class _PetCareTabNavigatorState extends State<PetCareTabNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => widget.page,
        );
      },
    );
  }
}
