import 'package:ecomerce_app/core/modules/purchase/proivder.dart';
import 'package:ecomerce_app/core/modules/purchase/purchase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/provider.dart';
import '../products/product_model.dart';

/// Check if a product was previously purchased by the user
final userPurchaseProvider =
    StreamProvider.autoDispose.family<Purchase?, ProductID>((ref, productId) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref
        .watch(purchasesRepositoryProvider)
        .watchUserPurchase(productId, user.uid);
  } else {
    return Stream.value(null);
  }
});
