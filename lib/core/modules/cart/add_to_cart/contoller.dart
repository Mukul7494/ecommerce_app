import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../products/product_model.dart';
import '../cart_services.dart';
import '../item.dart';

class AddToCartController extends StateNotifier<AsyncValue<int>> {
  AddToCartController({required this.cartService}) : super(const AsyncData(1));
  final CartService cartService;

  void updateQuantity(int quantity) {
    state = AsyncData(quantity);
  }

  Future<void> addItem(ProductID productId) async {
    final item = Item(productId: productId, quantity: state.value!);
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() => cartService.addItem(item));
    if (value.hasError) {
      state = AsyncError(value.error!);
    } else {
      state = const AsyncData(1);
    }
  }
}

final addToCartControllerProvider =
    StateNotifierProvider.autoDispose<AddToCartController, AsyncValue<int>>(
        (ref) {
  return AddToCartController(
    cartService: ref.watch(cartServiceProvider),
  );
});
