import 'package:flutter/material.dart';
import 'package:pet_adoption_hn/widgets/pet_description.dart';

import '../model/pet.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({Key? key, required this.petDetails, required this.shadowColor}) : super(key: key);
  final Pet petDetails;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PetDescription(
            petDetails: petDetails,
            shadowColor: shadowColor,
          ),
          const SizedBox(
            height: 48.0,
          )
        ],
      ),
    );
  }
}
