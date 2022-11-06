import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

Widget buildMenu() {
  return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                gapH16,
                Text(
                  "MOHIT,\nmohit@dev.in",
                  style: TextStyle(color: Colors.white),
                ),
                gapH20,
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(EvaIcons.percent, size: 20.0, color: Colors.white),
            title: const Text("Offers"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.support_agent,
                size: 20.0, color: Colors.white),
            title: const Text("Customer Service"),
            textColor: Colors.white,
            dense: true,
          ),
          const SizedBox(
            height: 160,
          ),
          ClipOval(
            clipper: MyClip(),
            child: ListTile(
              leading: IconButton(
                alignment: Alignment.bottomLeft,
                icon: const Icon(
                  EvaIcons.settings,
                  size: 30,
                ),
                onPressed: () => '',
              ),
            ),
          ),
          gapH8,
          ClipOval(
            clipper: MyClip(),
            child: ListTile(
              leading: IconButton(
                alignment: Alignment.bottomCenter,
                icon: const Icon(
                  EvaIcons.logOut,
                  size: 40,
                ),
                onPressed: () => '',
              ),
            ),
          ),
        ],
      ));
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
