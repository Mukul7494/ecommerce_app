import 'package:ecomerce_app/core/modules/prefrences/user_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/shared/controllers/theme_controller.dart';
import '../../../theme/utils/app_sizes.dart';

class PrefSet extends StatelessWidget {
  const PrefSet({super.key, required this.controller});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prefrences'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Customize App',
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
            gapH8,
            ElevatedButton(child: const Text('Home'), onPressed: () => ''),
            gapH4,
          ],
        ),
      ),
    );
  }
}
