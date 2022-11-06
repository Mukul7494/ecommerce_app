import 'package:ecomerce_app/core/modules/home/dash_board.dart';
import 'package:ecomerce_app/theme/core/flex_theme_dark.dart';
import 'package:ecomerce_app/theme/core/flex_theme_light.dart';
import 'package:ecomerce_app/theme/core/theme_data_dark.dart';
import 'package:ecomerce_app/theme/core/theme_data_light.dart';
import 'package:ecomerce_app/theme/shared/controllers/theme_controller.dart';
import 'package:ecomerce_app/theme/shared/utils/app_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/router.dart';

class MyApp extends ConsumerWidget {
  final ThemeController controller;
  const MyApp({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            themeMode: controller.themeMode,
            // routerConfig: router,
            title: 'eCommerce_App',
            scrollBehavior: const AppScrollBehavior(),
            theme: controller.useFlexColorScheme
                ? flexThemeLight(controller)
                : themeDataLight(controller),
            darkTheme: controller.useFlexColorScheme
                ? flexThemeDark(controller)
                : themeDataDark(controller),
            // localizationsDelegates: const [
            //   FormBuilderLocalizations.delegate,
            // ],
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        });
  }
}