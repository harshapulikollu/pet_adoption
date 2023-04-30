import 'package:flutter/material.dart';

import 'custom_text.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({Key? key, required this.gender}) : super(key: key);
  final String gender;
  @override
  Widget build(BuildContext context) {
    return CustomText('Gender: $gender',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: gender.toLowerCase() == 'male'
                ? Colors.blue
                : Colors.pinkAccent));
  }
}
