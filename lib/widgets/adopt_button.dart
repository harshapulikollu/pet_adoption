import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

import '../model/pet.dart';
import '../utils/colors.dart';
import 'custom_text.dart';

/// Button with shimmer effect, Thanks to [Neopop] from CRED app theme
class AdoptButton extends StatelessWidget {
  const AdoptButton(
      {Key? key, required this.petDetails, required this.confettiController})
      : super(key: key);
  final Pet petDetails;
  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ValueListenableBuilder(
            valueListenable: Hive.box('adopted_pets').listenable(),
            builder: (context, box, child) {
              final List adoptedPetsList =
                  box.get('adoptedPetsList', defaultValue: []);
              return NeoPopTiltedButton(
                isFloating: true,
                enabled: !adoptedPetsList.contains(petDetails),
                onTapUp: () {
                  HapticFeedback.lightImpact();
                },
                onTapDown: () {
                  HapticFeedback.lightImpact();
                  adoptedPetsList.add(petDetails);
                  box.put('adoptedPetsList', adoptedPetsList);
                  confettiController.play();
                  _showDialog(context, petDetails.name);
                },
                decoration: const NeoPopTiltedButtonDecoration(
                  color: kPopYellowColor,
                  plunkColor: kPlunkColorYellow,
                  shadowColor: kTiltedButtonShadowColor,
                  showShimmer: true,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 15,
                  ),
                  child: CustomText(
                    adoptedPetsList.contains(petDetails)
                        ? 'Already Adopted'
                        : 'Adopt me',
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _showDialog(BuildContext context, String petName) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText("You've now adopted $petName",
                      style: Theme.of(context).textTheme.headlineSmall),
                  NeoPopButton(
                      color: kPlunkColorYellow,
                      onTapUp: () {},
                      onTapDown: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: Text('Close'),
                      )),
                ],
              ),
            ),
          );
        });
  }
}
