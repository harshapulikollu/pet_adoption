import 'package:flutter/material.dart';

import '../widgets/Credits_text.dart';
import '../widgets/custom_text.dart';
import '../widgets/theme_switcher_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(MediaQuery.of(context).size.width, kToolbarHeight),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.navigate_before)),
              CustomText(
                'Settings',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
        body: Column(
          children: [
            ListTile(
              title: CustomText(
                'App theme',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: CustomText(
                'Switch app theme by selecting your preferred theme mode',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const ThemeSwitcherButton(),
            ),
            const SizedBox(height: 48.0,),
            const CreditsText(),
          ],
        ),
      ),
    );
  }
}
