import 'package:ecomerce_app/core/modules/cart/cart_services.dart';
import 'package:ecomerce_app/core/modules/cart/shopping_cart/item_builder.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../addon/async_value_widget.dart';
import '../../../../addon/primary_button.dart';
import '../../../router/go_router.dart';
import '../cart.dart';
import 'cart_controller.dart';
import 'item.dart';

/// Shopping cart screen showing the items in the cart (with editable
/// quantities) and a button to checkout.
class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      shoppingCartScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop(context),
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        title: Text('Shopping Cart'.hardcoded),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartValue = ref.watch(cartProvider);
          return AsyncValueWidget<Cart>(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.toItemsList(),
              itemBuilder: (_, item, index) => ShoppingCartItem(
                item: item,
                itemIndex: index,
              ),
              ctaBuilder: (_) => PrimaryButton(
                text: 'Checkout'.hardcoded,
                isLoading: state.isLoading,
                onPressed: () => context.pushNamed(AppRoute.checkout.name),
              ),
            ),
          );
        },
      ),
    );
  }
}
