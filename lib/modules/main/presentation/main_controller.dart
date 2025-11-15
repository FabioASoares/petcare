import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petcare/core/customs/petcare_tab_navigator.dart';
import 'package:petcare/core/helper/navigator.dart';
import 'package:petcare/modules/main/domain/main_usecase.dart';
import 'package:petcare/modules/main/enum/main_page_enum.dart';
import 'package:petcare/modules/main/state/main_state.dart';
import 'package:petcare/modules/novo_usuario/domain/entities/user_entity.dart';

ValueNotifier<bool> hasConnectionGlobal = ValueNotifier<bool>(true);
Map<MainPageEnum, GlobalKey<NavigatorState>> navigatorKeys = {};

class MainController extends ValueNotifier<MainState> {
  final MainUseCase _useCase;
  late UserEntity usuarioLogado;

  final Map<MainPageEnum, Widget> mainPages = {};

  GlobalKey<NavigatorState>? get currentNavigatorKey =>
      navigatorKeys[pageSelected.value];

  final ValueNotifier<MainPageEnum> pageSelected =
      ValueNotifier<MainPageEnum>(MainPageEnum.home);

  MainController(this._useCase) : super(InitialMainState()) {
    NavigatorPC.setChangePage(onDestinationSelected);
  }

  void init(UserEntity user) {
    usuarioLogado = user;

    mainPages.clear();
    navigatorKeys.clear();

    for (var itemPage in MainPageEnum.values) {
      navigatorKeys[itemPage] = GlobalKey<NavigatorState>();

      mainPages[itemPage] = _useCase.getMainPage(
        itemPage,
        usuarioLogado,
      );
    }

    notifyListeners();
  }

  void onDestinationSelected(int value) {
    pageSelected.value = MainPageEnum.values[value];
  }

  List<Widget> get getMainPages => List.generate(
        MainPageEnum.values.length,
        (index) {
          final page = MainPageEnum.values[index];

          return Offstage(
            offstage: pageSelected.value.index != index,
            child: PetCareTabNavigator(
              navigatorKey: navigatorKeys[page]!,
              page: mainPages[page]!,
            ),
          );
        },
      );

  List<GButton> get getMainButtons => List.generate(
        MainPageEnum.values.length,
        (index) {
          final page = MainPageEnum.values[index];

          return GButton(
            icon: page.iconData,
            text: page.label,
          );
        },
      );
}
