import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildMenu extends StatelessWidget {
  const BuildMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  backgroundImage: AssetImage('assets/images/person.jpg'),
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
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 0.2,
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
            leading: const Icon(Icons.category_outlined,
                size: 20.0, color: Colors.white),
            title: const Text("Categories"),
            textColor: Colors.white,
            dense: true,
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
            onTap: () {
              context.push("/contactus");
            },
            leading: const Icon(Icons.support_agent,
                size: 20.0, color: Colors.white),
            title: const Text("Customer Support"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {
              context.push("/aboutus");
            },
            leading: const Icon(Icons.info, size: 20.0, color: Colors.white),
            title: const Text("About Us"),
            textColor: Colors.white,
            dense: true,
          ),
          // ClipOval(
          //   clipper: MyClip(),
          //   child: ListTile(
          //     leading: IconButton(
          //       alignment: Alignment.bottomLeft,
          //       icon: const Icon(
          //         EvaIcons.settings,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //       onPressed: () {
          //         context.go('/theme');
          //       },
          //     ),
          //   ),
          // ),

          const SizedBox(
            height: 140,
          ),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 0.2,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    context.push("/settings");
                  },
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Settings',
                  ),
                  textColor: Colors.white,
                  dense: true,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text('Help and Feedback'),
                  textColor: Colors.white,
                  dense: true,
                )
              ],
            ),
          ),

          Container(
              padding: const EdgeInsets.only(left: 150),
              height: 100,
              child: const Text(
                "   V0.0.1[dev]\nBuild By Mohit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(202, 224, 118, 69),
                ),
              )),
        ],
      ),
    );
  }
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
