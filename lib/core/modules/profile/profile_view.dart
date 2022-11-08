import 'package:ecomerce_app/core/modules/auth/provider.dart';
import 'package:ecomerce_app/core/modules/profile/prefrences/user_prefrences.dart';
import 'package:ecomerce_app/core/modules/profile/profile_addon.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../theme/shared/controllers/theme_controller.dart';
import '../../../theme/utils/app_sizes.dart';
import '../../router/go_router.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});
  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateChangesProvider).value;
    if (user != null) {
      return Scaffold(
        body: SafeArea(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.5],
                            colors: [
                              Colors.indigo,
                              Colors.indigoAccent,
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 5,
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, right: 7),
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(
                              EvaIcons.settings,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              context.go('/settings');
                            },
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 5,
                        padding: const EdgeInsets.only(top: 75),
                        child: Text(
                          user.uid,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal,
                          width: 5,
                        ),
                        shape: BoxShape.circle),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                padding: const EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: Colors.red[900],
                            child: const Icon(
                              Icons.mail_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.email,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                padding: const EdgeInsets.only(left: 20, top: 10),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: Colors.green[900],
                            child: const Icon(
                              EvaIcons.activity,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Order History",
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  context.push("/sold");
                                },
                                child: const Text('View all'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              gapH8,
              CustomContainer(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                blurRadius: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.only(left: 12),
                      horizontalTitleGap: 0,
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      title: Text(
                        'App Preferences',
                      ),
                    ),
                    // controller.divider,
                    settingOptionPattern(
                      Icons.settings_rounded,
                      'Settings',
                      () => context.push("/settings"),
                    ),
                    // controller.divider,
                    settingOptionPattern(
                      Icons.help,
                      'Help Center',
                      () => context.push("/help"),
                    ),
                    // controller.divider,
                    settingOptionPattern(
                      Icons.security,
                      'Privacy & Terms',
                      () => context.push("/privacy"),
                    ),
                  ],
                ),
              ),
              gapH4,
              ProfileLogOutView(),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
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
            ElevatedButton(
                child: const Text('Login/SignUp'), onPressed: () => ''),
            gapH8,
            ElevatedButton(
                child: const Text('Settings'),
                onPressed: () => context.go('/theme')),
          ],
        ),
      );
    }
  }
}
