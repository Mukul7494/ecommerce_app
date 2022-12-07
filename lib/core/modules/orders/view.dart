import 'package:ecomerce_app/addon/responsive_center.dart';
import 'package:ecomerce_app/core/modules/orders/provider.dart';
import 'package:ecomerce_app/core/modules/orders/ui/card.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
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
              ? Column(
                  children: [
                    LottieBuilder.asset(
                      'assets/lottie/emptybox.json',
                      repeat: false,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                    const Text(
                      'You Have Not Purchased Anything',
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    gapH8,
                    ElevatedButton(
                        child: const Text('Home'), onPressed: () => ''),
                  ],
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => ResponsiveCenter(
                          padding: const EdgeInsets.all(Sizes.p8),
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
