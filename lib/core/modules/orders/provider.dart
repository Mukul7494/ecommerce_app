import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/provider.dart';
import 'data_provider.dart';
import 'orders.dart';

/// Watch the list of user orders
/// NOTE: Only watch this provider if the user is signed in.
final userOrdersProvider = StreamProvider.autoDispose<List<Order>>((ref) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    final ordersRepository = ref.watch(ordersRepositoryProvider);
    return ordersRepository.watchUserOrders(user.uid);
  } else {
    // If the user is null, just return an empty screen.
    return const Stream.empty();
  }
});
