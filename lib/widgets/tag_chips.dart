import 'package:flutter/material.dart';

import 'custom_text.dart';

/// Widget to display [Chips] which indicate the key qualities of the pet
class TagChips extends StatelessWidget {
  const TagChips({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags
          .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                label: CustomText(e),
              )))
          .toList(),
    );
  }
}
