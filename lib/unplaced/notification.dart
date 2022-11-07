import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('notification'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListTile(
          title: LottieBuilder.asset(
            'assets/lottie/notification.json',
            height: MediaQuery.of(context).size.height / 5,
          ),
          subtitle: const Text(
            'No new Notifications',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
