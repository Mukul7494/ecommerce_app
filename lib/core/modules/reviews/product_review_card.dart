
import 'package:ecomerce_app/core/modules/reviews/product_rating_bar.dart';
import 'package:ecomerce_app/core/modules/reviews/review.dart';
import 'package:ecomerce_app/utils/date_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/utils/app_sizes.dart';

/// Simple card widget to show a product review info (score, comment, date)
class ProductReviewCard extends ConsumerWidget {
  const ProductReviewCard(this.review, {super.key});
  final Review review;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormatted = ref.watch(dateFormatterProvider).format(review.date);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductRatingBar(
                  initialRating: review.rating,
                  ignoreGestures: true,
                  itemSize: 20,
                  // * ok to use an empty callback here since we're ignoring gestures
                  onRatingUpdate: (value) {},
                ),
                Text(dateFormatted, style: Theme.of(context).textTheme.caption),
              ],
            ),
            if (review.comment.isNotEmpty) ...[
              gapH16,
              Text(
                review.comment,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ],
        ),
      ),
    );
  }
}
