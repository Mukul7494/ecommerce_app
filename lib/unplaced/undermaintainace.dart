import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class WorkingProgress extends StatelessWidget {
  final String? message;
  const WorkingProgress({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/lottie/underwork.json',
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
            ),
            Text(
              'WORKING IN PROGRESS',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Text(
              'Thank you for visiting it will be soon updated',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            if (message != null) const SizedBox(height: 16),
            if (message != null)
              Text(
                message ?? "",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).errorColor,
                    ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Back to home'),
              onPressed: () => context.go('/home'),
            ),
          ],
        ),
      ),
    );
  }
}
