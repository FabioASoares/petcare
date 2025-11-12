import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:petcare/main_navigator.dart';
import 'package:petcare/splash_screen.dart';

import 'core/crashlytics/crashlytics.dart';
import 'services/sevices.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 2)).then((value) {
    FlutterNativeSplash.remove();
  });
  Crashlytics.iniciarLogs();

  ServicesImpl(Dio());
  runApp(const PetCare());
}

class PetCare extends StatefulWidget {
  const PetCare({super.key});

  @override
  State<PetCare> createState() => _PetCareState();
}

class _PetCareState extends State<PetCare> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appNavigatorKey,
      title: 'SGZ Notifica',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('pt'),
      ],
      home: const MainNavigator(
        widget: SplashScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(255, 255, 255, 1),
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(255, 255, 255, 1),
      centerTitle: true,
      foregroundColor: Colors.white,
    ),
  );
}
