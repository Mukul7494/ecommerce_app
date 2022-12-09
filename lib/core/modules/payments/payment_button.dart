import 'package:ecomerce_app/core/modules/payments/controller.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../addon/primary_button.dart';

/// Button used to initiate the payment flow.
class PaymentButton extends ConsumerWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      paymentButtonControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(paymentButtonControllerProvider);
    return PrimaryButton(
      text: 'Pay as COD'.hardcoded,
      isLoading: state.isLoading,
      onPressed: state.isLoading
          ? null
          : () => ref.read(paymentButtonControllerProvider.notifier).pay(),
    );
  }
}
