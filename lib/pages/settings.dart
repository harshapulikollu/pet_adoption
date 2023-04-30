import 'package:flutter/material.dart';

import '../widgets/credits_text.dart';
import '../widgets/custom_text.dart';
import '../widgets/navigate_back_button.dart';
import '../widgets/theme_switcher_list_tile.dart';

/// Page to display settings like change of app [Theme]
/// Also holds credits
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
              const NavigateBackButton(),
              CustomText(
                'Settings',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
        body: Column(
          children: const [
            ThemeSwitcherListTile(),
             SizedBox(height: 48.0,),
             CreditsText(),
          ],
        ),
      ),
    );
  }
}
