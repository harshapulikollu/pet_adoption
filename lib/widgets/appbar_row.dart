import 'package:flutter/material.dart';

import 'custom_text.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomText(
              'Pet Adoption',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        IconButton(
            key: const ObjectKey('history'),
            onPressed: () {
              Navigator.pushNamed(context, '/adoptionHistory');
            },
            icon: const Icon(Icons.history)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings)),
      ],
    );
  }
}
