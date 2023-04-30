import 'package:flutter/material.dart';
import 'package:pet_adoption_hn/pages/details.dart';
import 'package:pet_adoption_hn/widgets/custom_card.dart';
import 'package:pet_adoption_hn/widgets/tag_chips.dart';

import '../model/pet.dart' as pet_model;
import '../utils/colors.dart';
import 'custom_text.dart';
import 'dart:math' as math;

class CustomListItem extends StatefulWidget {
  const CustomListItem({Key? key, required this.pet}) : super(key: key);
  final pet_model.Pet pet;

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  late Color _shadowColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 2.0),
      child: CustomCard(
          onTap: () {
            Navigator.pushNamed(context, '/details',
                arguments: DetailsPageArguments(
                    petDetails: widget.pet,
                    heroTag: widget.pet.id.toString(),
                    shadowColor: _shadowColor));
          },
          shadowColor: _shadowColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 135,
                child: Hero(
                    tag: widget.pet.id.toString(),
                    child: Image.asset(
                      widget.pet.photos[0].small,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      widget.pet.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    CustomText(
                      widget.pet.description,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TagChips(tags: widget.pet.tags
                        .sublist(0, 3),),
                  ],
                ),
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _shadowColor = _getRandomShadowColor();
  }

  Color _getRandomShadowColor() {
    List<Color> shadowColors = [
      kShadowColorGreen,
      kShadowColorPurple,
      kShadowColorNeoPaccha,
      kShadowColorManna,
      kShadowColorPinkPong,
      kShadowColorOrangeSunshine
    ];
    return shadowColors[math.Random.secure().nextInt(shadowColors.length - 1)];
  }
}
