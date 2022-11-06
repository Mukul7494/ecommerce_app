import 'package:ecomerce_app/theme/shared/services/theme_service.dart';
import 'package:flutter/material.dart';

import '../../../theme/shared/controllers/theme_controller.dart';
import '../../../theme/shared/services/theme_service_hive.dart';
import '../../../theme/shared/widgets/universal/theme_mode_switch.dart';
import '../../../theme/shared/widgets/universal/theme_selector.dart';
import '../../../theme/widgets/dialogs/reset_settings_dialog.dart';

class UserPrefrences extends StatelessWidget {
  const UserPrefrences({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Customize App",
      )),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Theme mode'),
                    subtitle: Text('Mode ${themeController.themeMode.name}'),
                    trailing: ThemeModeSwitch(
                      themeMode: themeController.themeMode,
                      onChanged: themeController.setThemeMode,
                    ),
                    // Toggle theme mode also via the ListTile tap.
                    onTap: () {
                      if (Theme.of(context).brightness == Brightness.light) {
                        themeController.setThemeMode(ThemeMode.dark);
                      } else {
                        themeController.setThemeMode(ThemeMode.light);
                      }
                    },
                  ),
                  ThemeSelector(controller: themeController),
                  ListTile(
                    title: const Text('Reset preferences'),
                    subtitle: const Text('Reset all settings to default.'),
                    trailing: Card(
                      child: IconButton(
                        tooltip: 'Reset preferences',
                        icon: const Icon(Icons.replay_rounded),
                        onPressed: () async {
                          final bool? reset = await showDialog<bool?>(
                            context: context,
                            builder: (BuildContext context) {
                              return const ResetSettingsDialog();
                            },
                          );
                          if (reset ?? false) {
                            await themeController.resetAllToDefaults();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}