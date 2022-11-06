import 'package:ecomerce_app/core/modules/profile/prefrences/user_prefrences.dart';
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
      routes: [
        GoRoute(
          path: '/',
          redirect: (_) => '/dashboard/${dashBoardTabs[0]}',
        ),
        GoRoute(
          path: '/back',
          redirect: (_) => '/dashboard/${dashBoardTabs[3]}',
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
          path: '/theme',
          pageBuilder: (context, state) {
            return const MaterialPage(child: UserPrefrences());
          },
        ),
      ]);
});
