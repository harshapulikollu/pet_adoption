import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_hn/cubit/home_cubit.dart';

import '../widgets/appbar_row.dart';
import '../widgets/home_list_ui.dart';

/// Page to display all the [Pets] in a list
/// User can click/tap on the card of the desired pet and navigate to [DetailsPage]
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(MediaQuery.of(context).size.width, kToolbarHeight),
          child: const AppBarRow(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeLoadingFailed) {
                return const Center(
                  child: Text('Oops, something went wrong'),
                );
              }

              if (state is HomeLoadedSuccessfully) {
                final pets = state.responseApi;
                return HomeListUI(pets: pets);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
