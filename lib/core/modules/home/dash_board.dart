import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomerce_app/core/modules/home/widget/build_menu.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../theme/shared/controllers/theme_controller.dart';
import '../cart/cart_view.dart';
import '../orders/order_view.dart';
import '../profile/profile_view.dart';
import 'home_view.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    super.key,
  });

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final PageController _pageController = PageController();

  Future<void> _getUser() async {}
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              final state = _sideMenuKey.currentState;
              if (state!.isOpened) {
                state.closeSideMenu();
              } else {
                state.openSideMenu();
              }
            },
          ),
          title: const Text('U-SHOP'),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          color: Theme.of(context).primaryColor,
          items: const [
            Icon(
              EvaIcons.home,
            ),
            Icon(
              EvaIcons.shoppingBag,
            ),
            Icon(
              EvaIcons.shoppingCart,
            ),
            Icon(
              EvaIcons.person,
            ),
          ],
          onTap: _onTappedBar,
        ),
        body: PageView(
          controller: _pageController,
          children: const <Widget>[
            HomeView(),
            OrdersView(),
            CartView(),
            ProfileView(),
          ],
          onPageChanged: (page) {
            setState(() {});
          },
        ),
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {});
    _pageController.jumpToPage(value);
  }
}
