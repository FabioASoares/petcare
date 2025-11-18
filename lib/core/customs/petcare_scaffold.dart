import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_loading.dart';

class PetCareScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final List<Widget>? body;
  final bool isLoading;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final String tituloPagina;
  final String tituloAppBar;
  final String legendaPagina;
  final bool showBackButton;
  final MainAxisAlignment alinhamentoWidgets;
  final bool iconAppBar;
  final bool customAppBar;
  final Widget? menuLateral;
  final Future<void> Function()? onRefresh;
  final EdgeInsetsGeometry? padding;
  final String loadingMensagem;
  final String asset;
  final bool showNavBar;
  const PetCareScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomSheet,
    this.floatingActionButton,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerFloat,
    required this.isLoading,
    this.tituloAppBar = "",
    this.tituloPagina = "",
    this.legendaPagina = "",
    this.showBackButton = true,
    this.loadingMensagem = "Carregando...",
    this.alinhamentoWidgets = MainAxisAlignment.start,
    this.iconAppBar = false,
    this.customAppBar = false,
    this.menuLateral,
    this.onRefresh,
    this.padding,
    this.asset = "",
    this.showNavBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: ColorsPC.system.background,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: ColorsPC.system.background,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        endDrawer: menuLateral,
        backgroundColor: ColorsPC.system.background,
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        bottomSheet: _buildBottomBar(),
        body: SafeArea(
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return onRefresh != null
                      ? RefreshIndicator(
                          onRefresh: onRefresh!,
                          child: _buildBodyScaffold(
                            context,
                            constraints,
                            padding,
                          ),
                        )
                      : _buildBodyScaffold(
                          context,
                          constraints,
                          padding,
                        );
                },
              ),
              if (isLoading)
                PetCareLoading(
                  mensagemCarregamento: loadingMensagem,
                )
            ],
          ),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }

  Widget _buildBottomBar() {
    if (!showNavBar) return const SizedBox.shrink();

    return bottomSheet != null
        ? Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
              top: 8,
            ),
            child: bottomSheet,
          )
        : const SizedBox.shrink();
  }

  Widget _buildBodyScaffold(
    BuildContext context,
    BoxConstraints constraints,
    EdgeInsetsGeometry? padding,
  ) {
    return SingleChildScrollView(
      padding: padding ??
          EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight,
        ),
        child: Column(
          mainAxisAlignment: alinhamentoWidgets,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ...?body,
          ],
        ),
      ),
    );
  }
}
