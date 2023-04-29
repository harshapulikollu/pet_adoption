import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_hn/cubit/home_cubit.dart';
import 'package:pet_adoption_hn/widgets/custom_card.dart';

import '../widgets/custom_text.dart';
import '../widgets/list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(MediaQuery.of(context).size.width, kToolbarHeight),
          child: Row(
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
          ),
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
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeCubit>().getPets(0, filterString: '');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: [
                         CustomCard(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Icon(Icons.search),),
                              onChanged: (String? text){
                                if(text != null && text.length > 2){
                                  context.read<HomeCubit>().getPets(0, filterString: text ?? '');
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return CustomListItem(
                                pet: pets[index],
                              );
                            },
                            itemCount: pets.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
