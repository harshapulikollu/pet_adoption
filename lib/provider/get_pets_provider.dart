import 'package:pet_adoption_hn/provider/get_pets_provider_interface.dart';
import 'package:pet_adoption_hn/repository/get_pets_repository_interface.dart';

import '../model/pet.dart';

class GetPetsImp extends GetPetsProviderInterface {
  final GetPetsInterface getPetsRepository;
  GetPetsImp({
    required this.getPetsRepository,
});
  @override
  Future<List<Pet>> getPets(int pageIndex, {String? filterString}) async{
    final response = await getPetsRepository.getPets(pageIndex, filterString: filterString);
    return response;
  }

}