import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petcare/core/colors/petcare_colors.dart';

class PetCareLoading extends StatelessWidget {
  final String mensagemCarregamento;
  const PetCareLoading({
    super.key,
    this.mensagemCarregamento = "Carregando...",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorsPC.system.background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitFadingCircle(
                  color: ColorsPC.azul.x600,
                  size: 50.0,
                ),
                const SizedBox(height: 14),
                Text(
                  mensagemCarregamento,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
