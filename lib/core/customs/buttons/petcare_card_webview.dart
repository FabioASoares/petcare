import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/helper/petcare_text.dart';
import 'package:url_launcher/url_launcher.dart';

class PetCareCardWebView extends StatelessWidget {
  final String asset;
  final String title;
  final String description;
  final String link;
  final Color buttonColor;
  final String? buttonTitle;

  const PetCareCardWebView({
    super.key,
    required this.asset,
    required this.title,
    required this.description,
    required this.link,
    required this.buttonColor,
    this.buttonTitle,
  });

  Future<void> _openBrowser() async {
    final Uri uri = Uri.parse(link.trim());

    if (!await canLaunchUrl(uri)) {
      debugPrint('Nenhum navegador encontrado para abrir o link');
      return;
    }

    final bool success = await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    );

    if (!success) {
      debugPrint('Falha ao abrir o navegador');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: _openBrowser,
        child: Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: ColorsPC.system.pureWhite,
            image: DecorationImage(
              image: AssetImage(asset),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                ColorsPC.cinza.x850.withOpacity(0.4),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PetCareText.h4(
                title,
                paddings: const [20, 10, 10, 6],
                color: ColorsPC.system.pureWhite,
              ),
              PetCareText.body2(
                description,
                paddings: const [20, 0, 10, 6],
                color: ColorsPC.system.pureWhite,
                align: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: buttonColor,
                  ),
                  child: PetCareText.body3(
                    buttonTitle ?? "Saiba mais",
                    paddings: const [8, 8, 8, 8],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
