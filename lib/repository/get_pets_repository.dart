import 'package:pet_adoption_hn/repository/get_pets_repository_interface.dart';

import '../model/pet.dart';
import '../utils/fake_pets_data.dart';

class GetPetsRepositoryImp extends GetPetsInterface {

  @override
  Future<List<Pet>> getPets(int pageIndex, {String? filterString}) async{
    final allPets = Pets.fromMap(fakePetsData);
    List<Pet> pets = [];
    if(filterString != null && filterString.isNotEmpty){
      filterString = filterString.toLowerCase();
      for (var pet in allPets.pets) {
        if(pet.name.toLowerCase().contains(filterString) || pet.tags.contains(filterString) || pet.type.toLowerCase().contains(filterString) || pet.description.toLowerCase().contains(filterString)){
          pets.add(pet);
        }
      }
    }else{
      pets = allPets.pets;
    }

    if(pets.length > 10){
      pets  = pets.sublist(10 * pageIndex, (10 * 0)+10);
    }
   return pets;
  }

}