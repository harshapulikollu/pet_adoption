import 'package:pet_adoption_hn/repository/get_pets_repository_interface.dart';

import '../model/pet.dart';
import '../utils/fake_pets_data.dart';

/// class that implements the interface[GetPetsInterface] to get list of [Pets]
/// we FAKE API call, hardcoded [fakePetsData] gives us [JSON] response.
/// we shuffle the response to fake like data is being changed.
/// limit was hardcoded to 10 items.
class GetPetsRepositoryImp extends GetPetsInterface {
  @override
  Future<List<Pet>> getPets(int pageIndex, {String? filterString}) async {
    final allPets = Pets.fromMap(fakePetsData);
    List<Pet> pets = [];
    if (filterString != null && filterString.isNotEmpty) {
      filterString = filterString.toLowerCase();
      for (var pet in allPets.pets) {
        if (pet.name.toLowerCase().contains(filterString) ||
            pet.tags.contains(filterString) ||
            pet.type.toLowerCase().contains(filterString) ||
            pet.description.toLowerCase().contains(filterString)) {
          pets.add(pet);
        }
      }
    } else {
      pets = allPets.pets;
    }

    if (pets.length > 10) {
      int startIndex = 10 * pageIndex;
      if (startIndex > pets.length) return [];

      int endIndex = ((10 * pageIndex) + 10) > pets.length
          ? pets.length
          : ((10 * pageIndex) + 10);
      pets = pets.sublist(startIndex, endIndex);
    }
    pets.shuffle();
    return pets;
  }
}
