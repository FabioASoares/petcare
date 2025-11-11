import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> globalNavigator = GlobalKey();

class MainNavigator extends StatelessWidget {
  final Widget widget;
  const MainNavigator({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (globalNavigator.currentState!.canPop()) {
          globalNavigator.currentState!.pop();
        }
      },
      child: Navigator(
        key: globalNavigator,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => widget,
          );
        },
      ),
    );
  }
}
