import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_adoption_hn/widgets/list_item.dart';

import '../widgets/custom_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.navigate_before)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomText(
                  'Adoption history',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('adopted_pets').listenable(),
        builder: (context, box, child) {
          final List adoptedPetsList =
              box.get('adoptedPetsList', defaultValue: []);
          return ListView.builder(
              itemCount: adoptedPetsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CustomListItem(pet: adoptedPetsList[index]),
                );
              });
        },
      ),
    ));
  }
}
