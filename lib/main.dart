
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/pet.dart';
import 'my_app.dart';

/// First method that runs when app starts
Future<void> main() async {
  await _initHive();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

/// method to [init] [Hive] and registering [HiveAdapters]
Future<void> _initHive() async {
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
}
