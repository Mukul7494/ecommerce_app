import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecomerce_app/core/modules/auth/provider.dart';
import 'package:ecomerce_app/core/modules/offers/feature.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../../../addon/action_text_button.dart';
import '../../../theme/utils/app_sizes.dart';
import '../../router/go_router.dart';
import '../home/Custom_AppBar/more_menu.dart';
import '../home/Custom_AppBar/shopping_cart.dart';
import '../home/widget/build_menu.dart';

class OfferView extends StatefulWidget {
  OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final user = ref.watch(authStateChangesProvider).value;
      return SideMenu(
        key: _sideMenuKey,
        menu: const BuildMenu(),
        type: SideMenuType.shrinkNSlide,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                final state = _sideMenuKey.currentState;
                if (state!.isOpened) {
                  state.closeSideMenu();
                } else {
                  state.openSideMenu();
                }
              },
            ),
            title: Text('My Shop'.hardcoded),
            actions: [
              if (user != null) ...[
                ActionTextButton(
                  key: MoreMenuButton.ordersKey,
                  text: 'Orders'.hardcoded,
                  onPressed: () => context.pushNamed(AppRoute.orders.name),
                ),
                // ActionIconButton(
                //   key: MoreMenuButton.accountKey,
                //   onPressed: () => context.pushNamed(AppRoute.account.name),
                // ),
              ] else
                ActionTextButton(
                  key: MoreMenuButton.signInKey,
                  text: 'Sign In'.hardcoded,
                  onPressed: () => context.pushNamed(AppRoute.signIn.name),
                ),
              const ShoppingCartIcon(),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                LottieBuilder.asset(
                  'assets/lottie/discount-offer.json',
                  repeat: false,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Center(
                  child: AnimatedTextKit(
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Latest Offer And Running Sales',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                LottieBuilder.asset(
                  'assets/lottie/blackfriday.json',
                  repeat: true,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Featured(screenSize: screenSize),
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: AnimatedTextKit(
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'New Developer Build',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                LottieBuilder.asset(
                  'assets/lottie/offer1.json',
                  repeat: true,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                    ),
                    width: 300,
                    // color: Colors.black,
                    child: Column(children: [
                      Text(
                        '-- More Offers & Features --',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ])),
                LottieBuilder.asset(
                  'assets/lottie/coming-soon.json',
                  repeat: true,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                // const Text(
                //   'You Have Not Purchased Anything',
                //   textScaleFactor: 1.5,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //   ),
                // ),
                // gapH8,
                // ElevatedButton(child: const Text('Home'), onPressed: () => ''),
              ],
            ),
          ),
        ),
      );
    });
  }
}
