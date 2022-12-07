// Responsive widget showing the cart items and the checkout button
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';

import '../../../../addon/decorated_box_with_shadow.dart';
import '../../../../addon/empty_placeholder_widget.dart';
import '../../../../addon/responsive_center.dart';
import '../../../../constants/breeakpoints.dart';
import '../../../../theme/utils/app_sizes.dart';
import '../cart_total/cta.dart';
import '../item.dart';

class ShoppingCartItemsBuilder extends StatelessWidget {
  const ShoppingCartItemsBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.ctaBuilder,
  });
  final List<Item> items;
  final Widget Function(BuildContext, Item, int) itemBuilder;
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    // If there are no items, show a placeholder
    if (items.isEmpty) {
      return EmptyPlaceholderWidget(
        message: 'Your shopping cart is empty'.hardcoded,
      );
    }
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    // * on wide layouts, show a list of items on the left and the checkout
    // * button on the right
    if (screenWidth >= Breakpoint.tablet) {
      return ResponsiveCenter(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Row(
          children: [
            Flexible(
              // use 3 flex units for the list of items
              flex: 3,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return itemBuilder(context, item, index);
                },
                itemCount: items.length,
              ),
            ),
            gapW16,
            Flexible(
              // use 1 flex unit for the checkout button
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                child: CartTotalWithCTA(ctaBuilder: ctaBuilder),
              ),
            )
          ],
        ),
      );
    } else {
      // * on narrow layouts, show a [Column] with a scrollable list of items
      // * and a pinned box at the bottom with the checkout button
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(Sizes.p16),
              itemBuilder: (context, index) {
                final item = items[index];
                return itemBuilder(context, item, index);
              },
              itemCount: items.length,
            ),
          ),
          DecoratedBoxWithShadow(
            child: CartTotalWithCTA(ctaBuilder: ctaBuilder),
          ),
        ],
      );
    }
  }
}
