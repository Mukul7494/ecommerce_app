import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/utils/app_sizes.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LottieBuilder.asset(
            'assets/lottie/emptycart.json',
            repeat: false,
            fit: BoxFit.contain,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          const Text(
            'Your Cart is Empty',
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          gapH8,
          ElevatedButton(
              child: const Text('Start Shopping'), onPressed: () => ''),
        ],
      ),
    );
  }
}
