import 'package:ecomerce_app/core/modules/reviews/product_review_card.dart';
import 'package:ecomerce_app/core/modules/reviews/provider.dart';
import 'package:ecomerce_app/core/modules/reviews/review.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../addon/async_value_widget.dart';
import '../../../addon/responsive_center.dart';
import '../../../constants/breeakpoints.dart';
import '../../../theme/utils/app_sizes.dart';
import '../products/product_model.dart';

/// Shows the list of reviews for a given product ID
class ProductReviewsList extends ConsumerWidget {
  const ProductReviewsList({super.key, required this.productId});
  final ProductID productId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsValue = ref.watch(productReviewsProvider(productId));
    return AsyncValueSliverWidget<List<Review>>(
      value: reviewsValue,
      data: (reviews) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => ResponsiveCenter(
            maxContentWidth: Breakpoint.tablet,
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p16, vertical: Sizes.p8),
            child: ProductReviewCard(reviews[index]),
          ),
          childCount: reviews.length,
        ),
      ),
    );
  }
}
