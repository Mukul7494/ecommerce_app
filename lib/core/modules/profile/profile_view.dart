import 'package:ecomerce_app/core/modules/profile/prefrences/user_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/shared/controllers/theme_controller.dart';
import '../../../theme/utils/app_sizes.dart';
import '../../router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          'assets/lottie/register.json',
          repeat: false,
          fit: BoxFit.contain,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        const Text(
          'Login to continue',
          textScaleFactor: 1.5,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        gapH8,
        ElevatedButton(child: const Text('Login/SignUp'), onPressed: () => ''),
        gapH8,
        ElevatedButton(
            child: const Text('Settings'),
            onPressed: () => context.go('/theme')),
      ],
    );
  }
}
