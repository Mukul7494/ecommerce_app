import 'dart:async';

import 'package:ecomerce_app/core/modules/profile/prefrences/copyrights.dart';
import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:utils_widget/utils_widget.dart';

class ProfileLogOutView extends ConsumerWidget {
  ProfileLogOutView({Key? key}) : super(key: key);
  final LoadingButtonController controller = LoadingButtonController();
  void doSomething() async {
    Timer(Duration(seconds: 3), () {
      controller.success();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        LoadingButton(
          controller: controller,
          onPressed: doSomething,
          primaryColor: secondary(context),
          child: Text(
            'Log Out'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        gapH8,
        const CopyRights(),
      ],
    );
  }
}
