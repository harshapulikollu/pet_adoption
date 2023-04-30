import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_hn/widgets/search_widget.dart';

import '../cubit/home_cubit.dart';
import '../model/pet.dart';
import 'home_list_view.dart';

class HomeListUI extends StatelessWidget {
  const HomeListUI({Key? key, required this.pets}) : super(key: key);
  final List<Pet> pets;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeCubit>().getPets(pageIndex: 0, filterString: '');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            SearchWidget(onChanged: (String value){
              context.read<HomeCubit>().getPets(pageIndex: 0, filterString: value);
            },),
            HomeListView(
              pets: pets,
            ),
          ],
        ),
      ),
    );
  }
}
