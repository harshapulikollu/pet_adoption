import 'package:flutter/material.dart';

import 'custom_text.dart';

class PetNameWithShadow extends StatelessWidget {
  const PetNameWithShadow({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      name,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        color: Colors.white,
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
