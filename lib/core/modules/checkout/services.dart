import 'package:ecomerce_app/core/modules/purchase/proivder.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/date_provider.dart';
import '../auth/provider.dart';
import '../cart/cart.dart';
import '../cart/cart_provider.dart';
import '../orders/data_provider.dart';
import '../orders/orders.dart';
import '../products/product_provider.dart';
import '../purchase/purchase.dart';

/// A fake checkout service that doesn't process real payments.
class FakeCheckoutService {
  FakeCheckoutService(this.ref);
  final Ref ref;

  /// Temporary client-side logic for placing an order.
  /// Part of this logic should run on the server, so that we can:
  /// - setup a payment intent
  /// - show the payment UI
  /// - process the payment and fullfill the order
  /// The server-side logic will be covered in course #2
  Future<void> placeOrder() async {
    final authRepository = ref.read(authRepositoryProvider);
    final remoteCartRepository = ref.read(remoteCartRepositoryProvider);
    final ordersRepository = ref.read(ordersRepositoryProvider);
    final purchasesRepository = ref.read(purchasesRepositoryProvider);
    final currentDateBuilder = ref.read(currentDateBuilderProvider);
    // * Assertion operator is ok here since this method is only called from
    // * a place where the user is signed in
    final uid = authRepository.currentUser!.uid;
    // 1. Get the cart object
    final cart = await remoteCartRepository.fetchCart(uid);
    if (cart.items.isNotEmpty) {
      final total = _totalPrice(cart);
      final orderDate = currentDateBuilder();
      // * The orderId is a unique string that could be generated with the UUID
      // * package. Since this is a fake service, we just derive it from the date.
      final orderId = orderDate.toIso8601String();
      // 2. Create an order
      final order = Order(
        id: orderId,
        userId: uid,
        items: cart.items,
        orderStatus: OrderStatus.confirmed,
        orderDate: orderDate,
        total: total,
      );
      // 3. Save it using the repository
      await ordersRepository.addOrder(uid, order);
      // 4. Empty the cart
      await remoteCartRepository.setCart(uid, const Cart());
      // 5. Update reviews repository with purchase order data
      for (var entry in cart.items.entries) {
        await purchasesRepository.addPurchase(
          productId: entry.key,
          uid: uid,
          purchase: Purchase(orderId: orderId, orderDate: orderDate),
        );
      }
    } else {
      throw StateError('Can\'t place an order if the cart is empty'.hardcoded);
    }
  }

  // Helper method to calculate the total price
  double _totalPrice(Cart cart) {
    if (cart.items.isEmpty) {
      return 0.0;
    }
    final producsRepository = ref.read(productsRepositoryProvider);
    return cart.items.entries
        // first extract quantity * price for each item
        .map((entry) =>
            entry.value * // quantity
            producsRepository.getProduct(entry.key)!.price) // price
        // then add them up
        .reduce((value, element) => value + element);
  }
}

final checkoutServiceProvider = Provider<FakeCheckoutService>((ref) {
  return FakeCheckoutService(ref);
});
