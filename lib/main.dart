import 'dart:async';

import 'package:ecomerce_app/theme/shared/controllers/theme_controller.dart';
import 'package:ecomerce_app/theme/shared/services/theme_service.dart';
import 'package:ecomerce_app/theme/shared/services/theme_service_hive.dart';
import 'package:ecomerce_app/utils/asyc_logger.dart';
import 'package:ecomerce_app/utils/error_logger.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'package:flutter/cupertino.dart';

import 'core/modules/cart/cart_sync.dart';
import 'core/modules/cart/local/local_provider.dart';
import 'core/modules/cart/local/sembast_cart_provider.dart';

void main() async {
  late ErrorLogger errorLogger;
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
    await Hive.initFlutter();
    final ThemeService themeService =
        ThemeServiceHive('flex_color_scheme_v5_box_5');
    await themeService.init();
    themeController = ThemeController(themeService);
    await themeController.loadAll();
    final localCartRepository = await SembastCartRepository.makeDefault();
    // * Create ProviderContainer with any required overrides
    final container = ProviderContainer(
      overrides: [
        localCartRepositoryProvider.overrideWithValue(localCartRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
    errorLogger = container.read(errorLoggerProvider);
    // * Initialize CartSyncService to start the listener
    container.read(cartSyncServiceProvider);
    // * Entry point of the app
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: MyApp(
          controller: themeController,
        ),
      ),
    );
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
  });
}
