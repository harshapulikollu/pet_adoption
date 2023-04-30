import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_hn/cubit/home_cubit.dart';
import 'package:pet_adoption_hn/model/pet.dart';

import 'list_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({Key? key, required this.pets}) : super(key: key);
  final List<Pet> pets;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          return _onScrollNotification(scrollInfo, context);
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return CustomListItem(
              pet: pets[index],
            );
          },
          itemCount: pets.length,
        ),
      ),
    );
  }

  bool _onScrollNotification(
      ScrollNotification scrollInfo, BuildContext context) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      if (!context.read<HomeCubit>().reachedLast &&
          !context.read<HomeCubit>().isLoading) {
        context.read<HomeCubit>().getPets();
      } else {
        debugPrint('reachedLast');
      }
    }
    return false;
  }
}
