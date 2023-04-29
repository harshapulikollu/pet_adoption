import 'package:flutter/material.dart';
import 'package:pet_adoption_hn/pages/details.dart';
import 'package:pet_adoption_hn/widgets/custom_card.dart';

import '../model/pet.dart' as pet_model;
import '../utils/colors.dart';
import 'custom_text.dart';
import 'dart:math' as math;

class CustomListItem extends StatelessWidget {
  const CustomListItem({Key? key, required this.pet}) : super(key: key);
  final pet_model.Pet pet;


  @override
  Widget build(BuildContext context) {
    final shadowColor = _getRandomShadowColor();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomCard(
        onTap: (){
          Navigator.pushNamed(context, '/details', arguments: DetailsPageArguments(petDetails: pet, heroTag: pet.id.toString(), shadowColor: shadowColor));
        },
        shadowColor: shadowColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100, width: 100,
              child: Hero(
                  tag: pet.id.toString(),
                  child: Image.network(pet.photos[0].full)),),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(pet.name, style: Theme.of(context).textTheme.headlineMedium,),
                    const SizedBox(height: 4.0,),
                    CustomText(pet.description, style: Theme.of(context).textTheme.headlineSmall,),
                    const SizedBox(height: 4.0,),
                    Wrap(
                      children: pet.tags.sublist(0, 3).map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(label: Text(e),),
                      )).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  _getRandomShadowColor() {
    List<Color> shadowColors = [kShadowColorGrey, kShadowColorWhite, kShadowColorGreen, kShadowColorPurple, kShadowColorNeoPaccha, kShadowColorManna, kShadowColorPinkPong, kShadowColorOrangeSunshine];
    return shadowColors[math.Random.secure().nextInt(shadowColors.length -1)];
  }
}
