import 'package:flutter/material.dart';

import '../model/pet.dart';
import 'custom_text.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              contact.email,
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
                child: CustomText(contact.phone,
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
                '${contact.address.address1}, ${contact.address.city}, ${contact.address.state}, ${contact.address.country}',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
