import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_adoption_hn/cubit/home_cubit.dart';
import 'package:pet_adoption_hn/model/pet.dart';
import 'package:pet_adoption_hn/pages/home.dart';
import 'package:pet_adoption_hn/repository/get_pets_repository.dart';

class MockGetPetsRepositoryImp extends Mock implements GetPetsRepositoryImp {}

void main() {
  late MockGetPetsRepositoryImp mockGetPetsRepositoryImp;

  setUp(() {
    mockGetPetsRepositoryImp = MockGetPetsRepositoryImp();
  });

  Widget createWidgetForTest() {
    return BlocProvider(
      create: (context) => HomeCubit(mockGetPetsRepositoryImp),
      child: MaterialApp(
        title: 'Pet Adoption App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }

  testWidgets("title is displayed", (widgetTester) async {
    when(() => mockGetPetsRepositoryImp.getPets(0, filterString: ''))
        .thenAnswer((_) async => [
              Pet(
                  id: 1,
                  type: "type",
                  species: "species",
                  breeds: Breeds(
                      primary: "primary",
                      secondary: "secondary",
                      mixed: true,
                      unknown: true),
                  colors: PetColors(
                      primary: "primary",
                      secondary: "secondary",
                      tertiary: "tertiary"),
                  age: "age",
                  gender: "gender",
                  size: "size",
                  attributes: Attributes(
                      spayedNeutered: true,
                      houseTrained: true,
                      declawed: "declawed",
                      specialNeeds: true,
                      shotsCurrent: true),
                  environment:
                      Environment(children: true, dogs: true, cats: true),
                  tags: [],
                  name: "name",
                  description: "description",
                  photos: [],
                  status: "status",
                  publishedAt: "publishedAt",
                  contact: Contact(
                      email: "email",
                      phone: "phone",
                      address: Address(
                          address1: "address1",
                          address2: "address2",
                          city: "city",
                          state: "state",
                          postcode: "postcode",
                          country: "country")),
                  price: "price")
            ]);
    await widgetTester.pumpWidget(createWidgetForTest());
    expect(find.text("Pet Adoption"), findsOneWidget);
  });

  testWidgets("settings icon is displayed", (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetForTest());
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets("adoption history icon is displayed", (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetForTest());
    expect(find.byIcon(Icons.history), findsOneWidget);
  });
}
