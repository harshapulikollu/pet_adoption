import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';

import '../utils/colors.dart';

/// Wrapper widget for [NeoPopCard] to support dark and light themes
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.child, this.shadowColor, this.onTap}) : super(key: key);
  final Widget child;
  final Color? shadowColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ValueListenableBuilder(
          valueListenable: Hive.box('app_settings').listenable(),
          builder: (context, box, child1) {
            final isDarkMode = box.get('isDarkModeEnabled', defaultValue: false);
            return NeoPopCard(
              color:
                  isDarkMode ? kSecondaryButtonLightColor : kPrimaryButtonColor,
              borderColor: shadowColor ?? (isDarkMode ? kShadowColorDarkGreen : kShadowColorGrey),
              hShadowColor: shadowColor ?? (isDarkMode ? kShadowColorDarkGreen : kShadowColorGrey),
              vShadowColor: shadowColor ?? (isDarkMode ? kShadowColorDarkGreen : kShadowColorGrey),
              child: child,
            );
          }),
    );
  }
}
