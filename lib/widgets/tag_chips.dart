import 'package:flutter/material.dart';

import 'custom_text.dart';

class TagChips extends StatelessWidget {
  const TagChips({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags
          .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Chip(
                label: CustomText(e),
              )))
          .toList(),
    );
  }
}
