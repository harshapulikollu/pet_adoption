import 'package:flutter/material.dart';

/// Widget to display back button on clicking.
/// Made as widget to reuse it in multiple pages.
class NavigateBackButton extends StatelessWidget {
  const NavigateBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.navigate_before),
    );
  }
}
