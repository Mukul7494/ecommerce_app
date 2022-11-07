import 'dart:async';

import 'package:ecomerce_app/core/modules/auth/account/account_view.dart';
import 'package:ecomerce_app/core/modules/auth/signin/signin_view.dart';
import 'package:ecomerce_app/core/modules/cart/cart_view.dart';
import 'package:ecomerce_app/core/modules/orders/order_view.dart';
import 'package:ecomerce_app/core/modules/profile/prefrences/user_prefrences.dart';
import 'package:ecomerce_app/unplaced/Aboutus.dart';
import 'package:ecomerce_app/unplaced/contact.dart';
import 'package:ecomerce_app/unplaced/notification.dart';
import 'package:ecomerce_app/unplaced/undermaintainace.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../modules/auth/signin/signin_state.dart';
import 'error_404.dart';
import '../modules/auth/provider.dart';
import '../modules/home/dash_board.dart';

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
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    redirect: (state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.location == '/signIn') {
          return '/';
        }
      } else {
        if (state.location == '/account' || state.location == '/orders') {
          return '/';
        }
      }
      return null;
    },
    initialLocation: '/',
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (context, state) => const PageNotFound(),
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
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

        // GoRoute(
        //   path: 'cart',
        //   name: AppRoute.cart.name,
        //   pageBuilder: (context, state) => MaterialPage(
        //     key: state.pageKey,
        //     fullscreenDialog: true,
        //     child: const CartView(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'checkout',
        //   name: AppRoute.checkout.name,
        //   // pageBuilder: (context, state) => MaterialPage(
        //   //   key: ValueKey(state.location),
        //   //   fullscreenDialog: true,
        //   //   child: const CheckoutScreen(),
        //   // ),
        // ),
        // GoRoute(
        //   path: 'orders',
        //   name: AppRoute.orders.name,
        //   pageBuilder: (context, state) => MaterialPage(
        //     key: state.pageKey,
        //     fullscreenDialog: true,
        //     child: const OrdersView(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'account',
        //   name: AppRoute.account.name,
        //   pageBuilder: (context, state) => MaterialPage(
        //     key: state.pageKey,
        //     fullscreenDialog: true,
        //     child: const AccountView(),
        //   ),
        // ),
        routes: [
          GoRoute(
            path: '/signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const EmailPasswordSignInScreen(
                formType: EmailPasswordSignInFormType.signIn,
              ),
            ),
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
          GoRoute(
            path: '/notice',
            pageBuilder: (context, state) {
              return const MaterialPage(child: WorkingProgress());
            },
          ),
        ],
      ),
    ],
  );
});
