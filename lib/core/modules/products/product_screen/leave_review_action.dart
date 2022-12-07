import 'package:ecomerce_app/core/modules/products/product_model.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../addon/custom_text_button.dart';
import '../../../../addon/responsive_two_column_layout.dart';
import '../../../../theme/utils/app_sizes.dart';
import '../../../../utils/date_provider.dart';
import '../../../router/go_router.dart';
import '../../purchase/user_provider.dart';
import '../../reviews/reviews_service.dart';

/// Simple widget to show the product purchase date along with a button to
/// leave a review.
class LeaveReviewAction extends ConsumerWidget {
  const LeaveReviewAction({super.key, required this.productId});
  final ProductID productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchase = ref.watch(userPurchaseProvider(productId)).value;
    if (purchase != null) {
      final dateFormatted =
          ref.watch(dateFormatterProvider).format(purchase.orderDate);
      return Column(
        children: [
          const Divider(),
          gapH8,
          ResponsiveTwoColumnLayout(
            spacing: Sizes.p16,
            breakpoint: 300,
            startFlex: 3,
            endFlex: 2,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            startContent: Text('Purchased on $dateFormatted'.hardcoded),
            endContent: Consumer(
              builder: (context, ref, child) {
                final review =
                    ref.watch(userReviewStreamProvider(productId)).value;
                return CustomTextButton(
                  text: (review != null ? 'Update review' : 'Leave a review')
                      .hardcoded,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.green[700]),
                  onPressed: () => context.goNamed(
                    AppRoute.leaveReview.name,
                    params: {'id': productId},
                  ),
                );
              },
            ),
            midContent: Container(),
          ),
          gapH8,
        ],
      );
    } else {
      return Text("data");
    }
  }
}
