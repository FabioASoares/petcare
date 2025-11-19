import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare/core/colors/petcare_colors.dart';
import 'package:petcare/core/customs/petcare_loading.dart';
import 'package:petcare/core/extension/num_extensions.dart';
import 'package:petcare/core/helper/petcare_text.dart';

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
  final bool showSliverAppbar;
  final SliverAppBar? sliverAppBar;
  final Uint8List? fotoAppBar;

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
    this.showSliverAppbar = false,
    this.sliverAppBar,
    this.fotoAppBar,
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
        appBar: showSliverAppbar ? null : appBar,
        bottomSheet: _buildBottomBar(),
        body: showSliverAppbar
            ? _buildSliverBody(context)
            : _buildNormalBody(context),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }

  Widget _buildNormalBody(BuildContext context) {
    return SafeArea(
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
          if (isLoading) PetCareLoading(mensagemCarregamento: loadingMensagem),
        ],
      ),
    );
  }

  Widget _buildSliverBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverAppBar ??
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: fotoAppBar != null
                    ? _buildAppBarBackground()
                    : Container(color: Colors.grey),
              ),
            ),
        SliverToBoxAdapter(
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsPC.system.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...?body,
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBarBackground() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Image.memory(
                fotoAppBar!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.15.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 0.35.w,
                    height: 0.15.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: ColorsPC.system.pureWhite,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.memory(
                        fotoAppBar!,
                        width: 0.35.w,
                        height: 0.15.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  PetCareText.h4(
                    paddings: const [0, 10, 0, 0],
                    tituloAppBar,
                    color: ColorsPC.system.pureWhite,
                  ),
                  PetCareText.body1(
                    tituloPagina,
                    color: ColorsPC.system.pureWhite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    if (!showNavBar) return const SizedBox.shrink();

    return bottomSheet != null
        ? Padding(
            padding: const EdgeInsets.all(8),
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
