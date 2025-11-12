import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/helper/navigator.dart';

void showErrorToastMessage(
    {required String message,
    required String titulo,
    required BuildContext context,
    int? tempoExibicao}) {
  DelightToastBar(
    autoDismiss: true,
    position: DelightSnackbarPosition.top,
    snackbarDuration: Duration(milliseconds: tempoExibicao ?? 2500),
    animationDuration: const Duration(milliseconds: 100),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ToastCard(
          leading: Icon(
            Icons.close,
            color: ColorsPC.system.pureWhite,
          ),
          title: Text(
            titulo,
            style: TextStyle(
              color: ColorsPC.system.pureWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            message,
            style: TextStyle(
              color: ColorsPC.system.pureWhite,
            ),
          ),
          color: ColorsPC.vermelho.x550,
        ),
      );
    },
  ).show(context);
}

void showSuccessToastMessage({
  required String message,
  required String titulo,
  required BuildContext context,
  final int duration = 2500,
}) {
  DelightToastBar(
    autoDismiss: true,
    position: DelightSnackbarPosition.top,
    snackbarDuration: Duration(milliseconds: duration),
    animationDuration: const Duration(milliseconds: 200),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ToastCard(
          leading: Icon(
            Icons.check,
            color: ColorsPC.system.pureWhite,
          ),
          title: Text(
            titulo,
            style: TextStyle(
              color: ColorsPC.system.pureWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            message,
            style: TextStyle(
              color: ColorsPC.system.pureWhite,
            ),
          ),
          color: ColorsPC.verde.x500,
        ),
      );
    },
  ).show(context);
}

void showWarningToastMessage({
  required String message,
  required String titulo,
  required BuildContext context,
  final int duration = 2500,
}) {
  DelightToastBar(
    autoDismiss: true,
    position: DelightSnackbarPosition.top,
    snackbarDuration: Duration(milliseconds: duration),
    animationDuration: const Duration(milliseconds: 200),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ToastCard(
          leading: Icon(
            Icons.check,
            color: ColorsPC.system.pureWhite,
          ),
          title: Text(
            titulo,
            style: TextStyle(
              color: ColorsPC.system.pureWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            message,
            style: TextStyle(
              color: ColorsPC.system.pureWhite,
            ),
          ),
          color: ColorsPC.laranja.x500,
        ),
      );
    },
  ).show(context);
}

void showDialogOrderBy({
  required BuildContext context,
  required Function() ordemDecrescente,
  required Function() ordemCrescente,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text("Ordenar por"),
      actions: [
        CupertinoDialogAction(
          child: const Text("Mais Recentes"),
          onPressed: () {
            NavigatorPC.pop(context);
            ordemDecrescente();
          },
        ),
        CupertinoDialogAction(
          child: const Text("Mais Antigas"),
          onPressed: () {
            NavigatorPC.pop(context);
            ordemCrescente();
          },
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text("Cancelar"),
          onPressed: () {
            NavigatorPC.pop(context);
          },
        ),
      ],
    ),
  );
}
