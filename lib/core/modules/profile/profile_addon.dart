import 'dart:async';

import 'package:ecomerce_app/core/modules/profile/prefrences/copyrights.dart';
import 'package:ecomerce_app/theme/utils/app_sizes.dart';
import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../addon/action_text_button.dart';
import '../../../addon/alert_dialogs.dart';
import '../auth/account/account_controller.dart';
import '../auth/provider.dart';

class ProfileLogOutView extends ConsumerStatefulWidget {
  const ProfileLogOutView({super.key});
  @override
  ConsumerState<ProfileLogOutView> createState() => _ProfileLogOutViewState();
}

class _ProfileLogOutViewState extends ConsumerState<ProfileLogOutView> {
  final LoadingButtonController controller = LoadingButtonController();
  @override
  Widget build(
    BuildContext context,
  ) {
    ref.listen<AsyncValue>(
      accountControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(accountControllerProvider);
    final user = ref.watch(authStateChangesProvider).value;

    return Column(
      children: [
        LoadingButton(
          controller: controller,
          onPressed: state.isLoading
              ? null
              : () async {
                  ref.read(accountControllerProvider.notifier).signOut();
                },
          primaryColor: secondary(context),
          child: Text(
            'Log Out'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        gapH8,
        const CopyRights(),
      ],
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: state.isLoading
    //         ? const CircularProgressIndicator()
    //         : Text('Account'.hardcoded),
    //     actions: [
    //       ActionTextButton(
    //         text: 'Logout'.hardcoded,
    //         onPressed: state.isLoading
    //             ? null
    //             : () async {
    //                 final logout = await showAlertDialog(
    //                   context: context,
    //                   title: 'Are you sure?'.hardcoded,
    //                   cancelActionText: 'Cancel'.hardcoded,
    //                   defaultActionText: 'Logout'.hardcoded,
    //                 );
    //                 if (logout == true) {
    //                   ref.read(accountControllerProvider.notifier).signOut();
    //                 }
    //               },
    //       ),
    //     ],
    //   ),
    // );
  }
}
