import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

import '../utils/colors.dart';
import 'custom_text.dart';

/// Widget for [Theme] switcher button based on selected theme
class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('app_settings').listenable(),
        builder: (context, box, child) {
          final isDarkMode = box.get('isDarkModeEnabled', defaultValue: false);
          return NeoPopButton(
            color: isDarkMode ?  kSecondaryButtonLightColor : kPrimaryButtonColor,
            bottomShadowColor: isDarkMode ? kShadowColorDarkGreen : kShadowColorGrey,
            rightShadowColor: isDarkMode ? kShadowColorGreen : kShadowColorGrey,
            border: Border.all(
              color: isDarkMode ? kBorderColorGreen : kShadowColorGrey,
              width: kButtonBorderWidth,
            ),
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: (){
              HapticFeedback.lightImpact();
              box.put('isDarkModeEnabled', !isDarkMode);
            },
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: CustomText(isDarkMode ? 'Light' : 'Dark'),
            ),
          );
        }
    );
  }
}
