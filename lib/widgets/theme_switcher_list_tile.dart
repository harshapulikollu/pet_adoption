import 'package:flutter/material.dart';
import 'package:pet_adoption_hn/widgets/theme_switcher_button.dart';

import 'custom_text.dart';

class ThemeSwitcherListTile extends StatelessWidget {
  const ThemeSwitcherListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        'App theme',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: CustomText(
        'Switch app theme by selecting your preferred theme mode',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: const ThemeSwitcherButton(),
    );
  }
}
