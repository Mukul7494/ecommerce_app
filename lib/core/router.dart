// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import '../utils/error_404.dart';
// import 'modules/home/dash_board.dart';

// enum AppRoute {
//   home,
//   product,
//   leaveReview,
//   cart,
//   checkout,
//   orders,
//   account,
//   signIn,
// }

// final routerProvider = Provider<GoRouter>((ref) {
//   return GoRouter(
//       initialLocation: '/',
//       debugLogDiagnostics: kDebugMode,
//       errorBuilder: (context, state) => const PageNotFound(),
//       urlPathStrategy: UrlPathStrategy.path,
//       // redirect: (context, state) {},
//       routes: [
//         GoRoute(
//           path: 'DashBoard',
//           name: AppRoute.home.name,
//           builder: (context, state) => DashBoard(),
//         ),
//       ]);
// });
