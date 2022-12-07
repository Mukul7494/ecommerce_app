import 'package:ecomerce_app/addon/primary_button.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../core/router/go_router.dart';
import '../theme/utils/app_sizes.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/lottie/emptycart.json',
              repeat: false,
              fit: BoxFit.contain,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            gapH32,
            // PrimaryButton(
            //   onPressed: () => context.goNamed(AppRoute.home.name),
            //   text: 'Go Home'.hardcoded,
            // )
          ],
        ),
      ),
    );
  }
}
