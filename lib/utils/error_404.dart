import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class PageNotFound extends StatelessWidget {
  final String? message;
  const PageNotFound({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/lottie/error404.json',
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
            ),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Text(
              'The page you are looking for does not exist.',
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
              onPressed: () => context.go('/DashBoard'),
            ),
          ],
        ),
      ),
    );
  }
}
