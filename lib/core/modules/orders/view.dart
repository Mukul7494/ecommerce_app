import 'package:ecomerce_app/addon/responsive_center.dart';
import 'package:ecomerce_app/core/modules/orders/provider.dart';
import 'package:ecomerce_app/core/modules/orders/ui/card.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../addon/async_value_widget.dart';
import '../../../theme/utils/app_sizes.dart';
import 'orders.dart';

/// Shows the list of orders placed by the signed-in user.
class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'.hardcoded),
      ),
      body: Consumer(builder: (context, ref, _) {
        final userOrdersValue = ref.watch(userOrdersProvider);
        return AsyncValueWidget<List<Order>>(
          value: userOrdersValue,
          data: (orders) => orders.isEmpty
              ? Center(
                  child: Text(
                    'No previous orders'.hardcoded,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => ResponsiveCenter(
                          padding: EdgeInsets.all(Sizes.p8),
                          child: OrderCard(
                            order: orders[index],
                          ),
                        ),
                        childCount: orders.length,
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
