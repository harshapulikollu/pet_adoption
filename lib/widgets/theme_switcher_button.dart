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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return NeoPopButton(
      color: isDarkMode ?  kSecondaryButtonLightColor : kPrimaryButtonColor,
      bottomShadowColor: isDarkMode ? kShadowColorDarkGreen : kShadowColorGrey,
      rightShadowColor: isDarkMode ? kShadowColorGreen : kShadowColorGrey,
      border: Border.all(
        color: isDarkMode ? kBorderColorGreen : kShadowColorGrey,
        width: kButtonBorderWidth,
      ),
      onTapUp: () => HapticFeedback.lightImpact(),
      onTapDown: ()async{
        HapticFeedback.lightImpact();
        final box = await Hive.openBox('app_settings');
        box.put('isDarkModeEnabled', !isDarkMode);
      },
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: CustomText(isDarkMode ? 'Light' : 'Dark'),
      ),
    );
  }
}
