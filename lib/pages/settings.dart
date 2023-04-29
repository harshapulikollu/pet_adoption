import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neopop/neopop.dart';
import 'package:pet_adoption_hn/utils/colors.dart';

import '../widgets/custom_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.navigate_before)),
            CustomText('Settings', style: Theme.of(context).textTheme.headlineLarge,)
          ],
        ),),
        body: Column(
          children: [
            ListTile(
              title: CustomText('App theme',style: Theme.of(context).textTheme.titleLarge,),
              subtitle:
              CustomText('Switch app theme by selecting your preferred theme mode', style: Theme.of(context).textTheme.titleMedium,),
              trailing: ValueListenableBuilder(
                  valueListenable: Hive.box('app_settings').listenable(),
                builder: (context, box, child) {
                  final isDarkMode = box.get('isDarkModeEnabled', defaultValue: true);
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
