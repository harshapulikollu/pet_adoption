import 'package:flutter/material.dart';

import '../model/pet.dart';
import 'custom_card.dart';
import 'custom_text.dart';

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
                CustomText('Gender: ${petDetails.gender}',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText('Age: ${petDetails.age}',
                    style: Theme.of(context).textTheme.titleLarge),
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
            Wrap(
              children: petDetails.tags
                  .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(e),
                      )))
                  .toList(),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(),
            const CustomText(
              ' Contact:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const Icon(Icons.email),
                const SizedBox(
                  width: 8.0,
                ),
                CustomText(
                  petDetails.contact.email,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(
                  width: 8.0,
                ),
                Flexible(
                    child: CustomText(petDetails.contact.phone,
                        style: Theme.of(context).textTheme.titleLarge)),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const Icon(Icons.pin_drop),
                const SizedBox(
                  width: 8.0,
                ),
                CustomText(
                    '${petDetails.contact.address.address1}, ${petDetails.contact.address.city}, ${petDetails.contact.address.state}, ${petDetails.contact.address.country}',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
