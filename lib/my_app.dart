import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_adoption_hn/pages/details.dart';
import 'package:pet_adoption_hn/pages/history.dart';
import 'package:pet_adoption_hn/pages/home.dart';
import 'package:pet_adoption_hn/pages/image_viewer.dart';
import 'package:pet_adoption_hn/pages/settings.dart';
import 'package:pet_adoption_hn/provider/get_pets_provider.dart';
import 'package:pet_adoption_hn/repository/get_pets_repository.dart';

import 'cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('app_settings').listenable(),
        builder: (context, box, child) {
          final isDarkMode = box.get('isDarkModeEnabled', defaultValue: false);
          return BlocProvider(
            create: (context) => HomeCubit(
                GetPetsImp(getPetsRepository: GetPetsRepositoryImp())),
            child: MaterialApp(
              title: 'Pet Adoption App',
              debugShowCheckedModeBanner: false,
              theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
              initialRoute: '/',
              routes: {
                '/': (context) => const HomePage(),
                '/details': (context) => const DetailsPage(),
                '/settings': (context) => const SettingsPage(),
                '/adoptionHistory': (context) => const HistoryPage(),
                '/imageViewer': (context) => const ImageViewer()
              },
            ),
          );
        });
  }
}
