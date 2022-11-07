import 'package:ecomerce_app/core/modules/profile/prefrences/user_prefrences.dart';
import 'package:ecomerce_app/unplaced/Aboutus.dart';
import 'package:ecomerce_app/unplaced/contact.dart';
import 'package:ecomerce_app/unplaced/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../utils/error_404.dart';
import 'modules/home/dash_board.dart';

enum AppRoute {
  home,
  product,
  leaveReview,
  cart,
  theme,
  checkout,
  orders,
  account,
  signIn,
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: kDebugMode,
      errorBuilder: (context, state) => const PageNotFound(),
      urlPathStrategy: UrlPathStrategy.path,
      // redirect: (context, state) {},
      refreshListenable: RouterNotifier(ref),
      routes: [
        GoRoute(
          path: '/',
          redirect: (_) => '/dashboard/${dashBoardTabs[0]}',
        ),
        GoRoute(
          path: '/dashboard/:id',
          builder: (context, state) {
            return DashBoard(
              key: state.pageKey,
              selectedTab: state.params['id']!,
            );
          },
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) {
            return const MaterialPage(child: UserPrefrences());
          },
        ),
        GoRoute(
          path: '/notification',
          pageBuilder: (context, state) {
            return const MaterialPage(child: NotificationView());
          },
        ),
        GoRoute(
          path: '/aboutus',
          pageBuilder: (context, state) {
            return const MaterialPage(child: AboutUs());
          },
        ),
        GoRoute(
          path: '/contactus',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ContactView());
          },
        ),
      ]);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // _ref.listen<User?>(
    //   userProvider,
    //   (_, __) => notifyListeners(),
    // );
  }
}
