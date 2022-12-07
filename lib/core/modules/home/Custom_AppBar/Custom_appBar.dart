import 'package:ecomerce_app/utils/replaced_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../../../addon/action_text_button.dart';
import '../../../../constants/breeakpoints.dart';
import '../../../router/go_router.dart';
import '../../auth/provider.dart';
import '../widget/build_menu.dart';
import 'more_menu.dart';
import 'shopping_cart.dart';

class CustomAppBar extends ConsumerWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    // * This widget is responsive.
    // * On large screen sizes, it shows all the actions in the app bar.
    // * On small screen sizes, it shows only the shopping cart icon and a
    // * [MoreMenuButton].
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.

    return AppBar(
      title: Text('My Shop'.hardcoded),
      actions: [
        const ShoppingCartIcon(),
        if (user != null) ...[
          ActionIconButton(
            // key: MoreMenuButton.accountKey,
            onPressed: () => context.pushNamed(AppRoute.account.name),
          ),
        ] else
          ActionTextButton(
            key: MoreMenuButton.signInKey,
            text: 'Sign In'.hardcoded,
            onPressed: () => context.pushNamed(AppRoute.signIn.name),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
