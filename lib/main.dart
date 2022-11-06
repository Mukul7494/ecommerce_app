import 'package:ecomerce_app/theme/shared/controllers/theme_controller.dart';
import 'package:ecomerce_app/theme/shared/services/theme_service.dart';
import 'package:ecomerce_app/theme/shared/services/theme_service_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final ThemeService themeService =
      ThemeServiceHive('flex_color_scheme_v5_box_5');
  await themeService.init();
  themeController = ThemeController(themeService);
  await themeController.loadAll();
  runApp(ProviderScope(
    child: MyApp(
      controller: themeController,
    ),
  ));
}
