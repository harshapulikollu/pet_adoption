import 'package:flutter/material.dart';
import 'package:pet_adoption_hn/widgets/gender_widget.dart';
import 'package:pet_adoption_hn/widgets/tag_chips.dart';

import '../model/pet.dart';
import 'contact_details.dart';
import 'custom_card.dart';
import 'custom_text.dart';

/// Widget to display pet details
class PetDescription extends StatelessWidget {
  const PetDescription(
      {Key? key, required this.petDetails, required this.shadowColor})
      : super(key: key);
  final Pet petDetails;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      shadowColor: shadowColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              petDetails.description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Type: ${petDetails.type}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomText('Age: ${petDetails.age}',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderWidget(gender: petDetails.gender),
                CustomText(
                  'Price: ${petDetails.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.green),
                ),
              ],
            ),
            const Divider(),
            TagChips(tags: petDetails.tags),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(),
            ContactDetails(contact: petDetails.contact),
          ],
        ),
      ),
    );
  }
}
