import 'dart:math';

import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../addon/alert_dialogs.dart';
import '../../../../addon/async_value_widget.dart';
import '../../../../addon/custom_image.dart';
import '../../../../addon/item_quantity_selector.dart';
import '../../../../addon/responsive_two_column_layout.dart';
import '../../../../theme/utils/app_sizes.dart';
import '../../../../utils/currency_view.dart';
import '../../products/product_model.dart';
import '../../products/product_provider.dart';
import '../item.dart';
import 'cart_controller.dart';

/// Shows a shopping cart item (or loading/error UI if needed)
class ShoppingCartItem extends ConsumerWidget {
  const ShoppingCartItem({
    super.key,
    required this.item,
    required this.itemIndex,
    this.isEditable = true,
  });
  final Item item;
  final int itemIndex;

  /// if true, an [ItemQuantitySelector] and a delete button will be shown
  /// if false, the quantity will be shown as a read-only label (used in the
  /// [PaymentPage])
  final bool isEditable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productProvider(item.productId));
    return AsyncValueWidget<Product?>(
      value: productValue,
      data: (product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: ShoppingCartItemContents(
              product: product!,
              item: item,
              itemIndex: itemIndex,
              isEditable: isEditable,
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows a shopping cart item for a given product
class ShoppingCartItemContents extends ConsumerWidget {
  const ShoppingCartItemContents({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
    required this.isEditable,
  });
  final Product product;
  final Item item;
  final int itemIndex;
  final bool isEditable;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted =
        ref.watch(currencyFormatterProvider).format(product.price);
    return ResponsiveTwoColumnLayout(
      startFlex: 2,
      endFlex: 6,
      breakpoint: 300,
      startContent: CustomImage(imageUrl: product.imageUrl),
      spacing: Sizes.p24,
      midContent: const SizedBox(),
      endContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(product.title, style: Theme.of(context).textTheme.headline6),
          gapH24,
          Text(priceFormatted, style: Theme.of(context).textTheme.headline5),
          gapH24,
          isEditable
              // show the quantity selector and a delete button
              ? EditOrRemoveItemWidget(
                  product: product,
                  item: item,
                  itemIndex: itemIndex,
                )
              // else, show the quantity as a read-only label
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                  child: Text(
                    'Quantity: ${item.quantity}'.hardcoded,
                  ),
                ),
        ],
      ),
    );
  }
}

// custom widget to show the quantity selector and a delete button
class EditOrRemoveItemWidget extends ConsumerWidget {
  const EditOrRemoveItemWidget({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
  });
  final Product product;
  final Item item;
  final int itemIndex;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemQuantitySelector(
          quantity: item.quantity,
          maxQuantity: min(product.availableQuantity, 10),
          itemIndex: itemIndex,
          onChanged: state.isLoading
              ? null
              : (quantity) => ref
                  .read(shoppingCartScreenControllerProvider.notifier)
                  .updateItemQuantity(item.productId, quantity),
        ),
        IconButton(
          key: deleteKey(itemIndex),
          icon: Icon(Icons.delete, color: Colors.red[700]),
          onPressed: state.isLoading
              ? null
              : () async {
                  final del = await showAlertDialog(
                    context: context,
                    title: 'Are you sure?'.hardcoded,
                    cancelActionText: 'Keep'.hardcoded,
                    defaultActionText: 'Remove'.hardcoded,
                  );
                  if (del == true) {
                    ref
                        .read(shoppingCartScreenControllerProvider.notifier)
                        .removeItemById(item.productId);
                  }
                },
        ),
        const Spacer(),
      ],
    );
  }
}
