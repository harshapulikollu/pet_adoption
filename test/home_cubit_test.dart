import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_adoption_hn/cubit/home_cubit.dart';
import 'package:pet_adoption_hn/model/pet.dart';
import 'package:pet_adoption_hn/repository/get_pets_repository.dart';

class MockGetPetsRepositoryImp extends Mock implements GetPetsRepositoryImp {}

void main() {
  late HomeCubit sut;
  late MockGetPetsRepositoryImp mockGetPetsRepositoryImp;

  setUp(() {
    mockGetPetsRepositoryImp = MockGetPetsRepositoryImp();
    sut = HomeCubit(mockGetPetsRepositoryImp);
  });

  test(
    "check initial values are correct",
    () {
      expect(sut.isLoading, false);
      expect(sut.reachedLast, false);
    },
  );

  group("getPets", () {
    test("get pets using GetPetsRepositoryImp", () async {
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
      await sut.getPets();
      verify(() => mockGetPetsRepositoryImp.getPets(0, filterString: ''))
          .called(1);
    });
  });
}
