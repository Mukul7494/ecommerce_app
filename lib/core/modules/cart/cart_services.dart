import 'dart:math';

import 'package:ecomerce_app/core/modules/cart/cart.dart';
import 'package:ecomerce_app/core/modules/cart/mutable_cart.dart';
import 'package:ecomerce_app/core/modules/products/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/provider.dart';
import '../products/product_provider.dart';
import 'cart_provider.dart';
import 'item.dart';
import 'local/local_provider.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  /// fetch the cart from the local or remote repository
  /// depending on the user auth state
  Future<Cart> _fetchCart() {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      return ref.read(remoteCartRepositoryProvider).fetchCart(user.uid);
    } else {
      return ref.read(localCartRepositoryProvider).fetchCart();
    }
  }

  /// save the cart to the local or remote repository
  /// depending on the user auth state
  Future<void> _setCart(Cart cart) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      await ref.read(remoteCartRepositoryProvider).setCart(user.uid, cart);
    } else {
      await ref.read(localCartRepositoryProvider).setCart(cart);
    }
  }

  /// sets an item in the local or remote cart depending on the user auth state
  Future<void> setItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
  }

  /// adds an item in the local or remote cart depending on the user auth state
  Future<void> addItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.addItem(item);
    await _setCart(updated);
  }

  /// removes an item from the local or remote cart depending on the user auth
  /// state
  Future<void> removeItemById(ProductID productId) async {
    final cart = await _fetchCart();
    final updated = cart.removeItemById(productId);
    await _setCart(updated);
  }
}

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref);
});

final cartProvider = StreamProvider<Cart>((ref) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref.watch(remoteCartRepositoryProvider).watchCart(user.uid);
  } else {
    return ref.watch(localCartRepositoryProvider).watchCart();
  }
});

final cartItemsCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.items.length,
        orElse: () => 0,
      );
});

final cartTotalProvider = Provider.autoDispose<double>((ref) {
  final cart = ref.watch(cartProvider).value ?? const Cart();
  final productsList = ref.watch(productsListStreamProvider).value ?? [];
  if (cart.items.isNotEmpty && productsList.isNotEmpty) {
    var total = 0.0;
    for (final item in cart.items.entries) {
      final product =
          productsList.firstWhere((product) => product.id == item.key);
      total += product.price * item.value;
    }
    return total;
  } else {
    return 0.0;
  }
});

final itemAvailableQuantityProvider =
    Provider.autoDispose.family<int, Product>((ref, product) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given product in the cart
    final quantity = cart.items[product.id] ?? 0;
    // subtract it from the product available quantity
    return max(product.availableQuantity - quantity, 0);
  } else {
    return product.availableQuantity;
  }
});
