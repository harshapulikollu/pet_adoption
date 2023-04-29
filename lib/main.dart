import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_adoption_hn/pages/details.dart';
import 'package:pet_adoption_hn/pages/history.dart';
import 'package:pet_adoption_hn/pages/home.dart';
import 'package:pet_adoption_hn/pages/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_hn/provider/get_pets_provider.dart';
import 'package:pet_adoption_hn/repository/get_pets_repository.dart';

import 'cubit/home_cubit.dart';
import 'model/pet.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(PetsAdapter())
    ..registerAdapter(PetAdapter())
    ..registerAdapter(AttributesAdapter())
    ..registerAdapter(BreedsAdapter())
    ..registerAdapter(PetColorsAdapter())
    ..registerAdapter(ContactAdapter())
    ..registerAdapter(AddressAdapter())
    ..registerAdapter(EnvironmentAdapter())
    ..registerAdapter(PhotoAdapter());
  await Hive.openBox('app_settings');
  await Hive.openBox('adopted_pets');
        Hive.box('adopted_pets').clear();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('max width: ${window.physicalSize.width}');
    return ValueListenableBuilder(
        valueListenable: Hive.box('app_settings').listenable(),
        builder: (context, box, child) {
          final isDarkMode = box.get('isDarkModeEnabled', defaultValue: false);
          return BlocProvider(
            create: (context) => HomeCubit(
                getPetsProvider:
                    GetPetsImp(getPetsRepository: GetPetsRepositoryImp())),
            child: MaterialApp(
              title: 'Pet Adoption App',
              debugShowCheckedModeBanner: false,
              theme: isDarkMode ? ThemeData.dark() : ThemeData(),
              initialRoute: '/',
              routes: {
                '/': (context) => const HomePage(),
                '/details': (context) => const DetailsPage(),
                '/settings': (context) => const SettingsPage(),
                '/adoptionHistory': (context) => const HistoryPage()
              },
            ),
          );
        });
  }
}
