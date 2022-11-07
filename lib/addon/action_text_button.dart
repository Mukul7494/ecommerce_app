import 'package:flutter/material.dart';

import '../theme/utils/app_sizes.dart';

/// Text button to be used as an [AppBar] action
class ActionTextButton extends StatelessWidget {
  const ActionTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Color.fromARGB(255, 245, 248, 244))),
    );
  }
}

class ActionIconButton extends StatelessWidget {
  const ActionIconButton({super.key, this.onPressed});

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.person),
    );
  }
}
