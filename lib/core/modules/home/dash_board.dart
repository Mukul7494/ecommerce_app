import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomerce_app/core/modules/cart/cart_view.dart';
import 'package:ecomerce_app/core/modules/home/home_view.dart';
import 'package:ecomerce_app/core/modules/home/widget/build_menu.dart';
import 'package:ecomerce_app/core/modules/orders/order_view.dart';
import 'package:ecomerce_app/core/modules/profile/profile_view.dart';
import 'package:ecomerce_app/unplaced/floatingReportbtn.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../addon/action_text_button.dart';
import '../../router/go_router.dart';
import '../auth/provider.dart';
import 'Custom_AppBar/more_menu.dart';
import 'Custom_AppBar/shopping_cart.dart';

class DashBoard extends StatefulWidget {
  DashBoard({
    required String selectedTab,
    Key? key,
  })  : index = dashBoardTabs.indexWhere((tab) => tab == selectedTab),
        super(key: key) {
    assert(index != -1);
  }

  final int index;

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  late final TabController _controller;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: dashBoardTabs.length,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DashBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      OrdersView(),
      CartView(),
      ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                  ActionIconButton(
                    key: MoreMenuButton.accountKey,
                    onPressed: () => context.pushNamed(AppRoute.account.name),
                  ),
                ] else
                  ActionTextButton(
                    key: MoreMenuButton.signInKey,
                    text: 'Sign In'.hardcoded,
                    onPressed: () => context.pushNamed(AppRoute.signIn.name),
                  ),
                const ShoppingCartIcon(),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: const FloatinReportBtn(),
            bottomNavigationBar: NavigationBar(
              selectedIndex: _controller.index,
              onDestinationSelected: (index) =>
                  context.go('/dashboard/${dashBoardTabs[index]}'),
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(
                    EvaIcons.homeOutline,
                  ),
                  icon: const Icon(
                    EvaIcons.home,
                  ),
                  label: dashBoardTabs[0].toCapitalized(),
                ),
                NavigationDestination(
                  selectedIcon: const Icon(
                    EvaIcons.percentOutline,
                  ),
                  icon: const Icon(
                    EvaIcons.percent,
                  ),
                  label: dashBoardTabs[1].toCapitalized(),
                ),
                NavigationDestination(
                  selectedIcon: const Icon(
                    EvaIcons.shoppingBagOutline,
                  ),
                  icon: const Icon(
                    EvaIcons.shoppingBag,
                  ),
                  label: dashBoardTabs[2].toCapitalized(),
                ),
                NavigationDestination(
                  selectedIcon: const Icon(
                    EvaIcons.personOutline,
                  ),
                  icon: const Icon(
                    EvaIcons.person,
                  ),
                  label: dashBoardTabs[3].toCapitalized(),
                ),
              ],
            ),
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: _buildScreens(),
            ),
          ),
          // error: (error, stack) => Material(
          //   child: Center(
          //     child: Text(
          //       error.toString(),
          //     ),
          //   ),
          // ),
          // loading: () => const Material(
          //   child: Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
        );
      },
    );
  }
}

List<String> dashBoardTabs = [
  'home',
  'offers',
  'orders',
  'profile',
];
