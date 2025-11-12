import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/modules/login/di/login_module.dart';
import 'package:petcare/modules/login/presentation/login_controller.dart';
import 'package:petcare/modules/login/presentation/login_page.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({super.key});

  @override
  State<PreLoginPage> createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();

    LoginModule.init();
    _controller = LoginModule.getController();
    _controller.initData();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/pre_login.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 62),
                      child: Text(
                        "Tudo para o seu Pet, em um só lugar",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PetCareButton(
                      title: "Vamos Começar?",
                      iconOnTheLeft: true,
                      iconRotation: -45,
                      spacingLeftIcon: 20,
                      leftIcon: Icons.pets,
                      colors: ColorsPC.system.pureWhite,
                      paddings: const [20, 0, 20, 0],
                      onTap: () {
                        NavigatorPC.push(context, const LoginPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
