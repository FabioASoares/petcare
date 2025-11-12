import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/buttons/petcare_button.dart';
import 'package:petcare/core/customs/buttons/petcare_text_button.dart';
import 'package:petcare/core/customs/petcare_scaffold.dart';
import 'package:petcare/core/customs/petcare_textfield.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:petcare/modules/home/presentation/home_page.dart';
import 'package:petcare/modules/login/di/login_module.dart';
import 'package:petcare/modules/novo_usuario/presentation/novo_usuario_page.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();

    _controller = LoginModule.getController();
  }

  @override
  void dispose() {
    LoginModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PetCareScaffold(
      isLoading: false,
      body: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 70, 30, 50),
            child: Image.asset(
              "assets/images/logo_app.png",
              width: 300,
            ),
          ),
        ),
        const Center(
          child: Text(
            "Bem vindo de volta!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        PetCareTextField(
          paddings: const [10, 60, 10, 20],
          controller: _controller.emailController,
          prefixIcon: Icons.pets,
          placeholder: "Digite seu e-mail",
        ),
        PetCareTextField(
          paddings: const [10, 0, 10, 0],
          controller: _controller.emailController,
          prefixIcon: Icons.lock,
          placeholder: "Digite sua senha",
        ),
        PetCareTextButton(
          paddings: const [0, 10, 20, 0],
          mainAxisAlignment: MainAxisAlignment.end,
          onTap: () {},
          title: "Esqueceu a senha?",
          titleColor: ColorsPC.turquesa.x500,
        ),
        PetCareButton(
          title: "Entrar",
          onTap: irHomePage,
          iconOnTheRight: true,
          iconRotation: 45,
          spacingRightIcon: 20,
          rightIcon: Icons.pets,
          colors: ColorsPC.system.pureWhite,
          paddings: const [10, 30, 10, 0],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PetCareText.h6(
              "Ainda não tem conta? ",
              paddings: const [20, 20, 0, 20],
            ),
            PetCareTextButton(
              title: "Clique Aqui",
              titleColor: ColorsPC.turquesa.x500,
              onTap: irCriarConta,
            ),
          ],
        )
      ],
    );
  }

  void irCriarConta() {
    NavigatorPC.push(context, const NovoUsuarioPage());
  }

  void irHomePage() {
    NavigatorPC.pushAndRemoveUntil(context, const HomePage());
  }
}
