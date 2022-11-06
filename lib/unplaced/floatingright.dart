import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FloatingMenu extends StatefulWidget {
  const FloatingMenu({super.key});

  @override
  State<FloatingMenu> createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.subject,
      activeIcon: Icons.close,
      // animatedIcon: AnimatedIcons.list_view,
      animatedIconTheme: const IconThemeData(size: 30),
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.call,
          ),
          onTap: () => launchUrlString('tel:919813256255'),
          label: ' Call',
        ),
        SpeedDialChild(
          child: const Icon(Icons.message),
          onTap: () => launchUrlString('sms:98132562125'),
          label: ' Message',
        ),
      ],
    );
  }
}
