import '../model/pet.dart';

abstract class GetPetsInterface {
  Future<List<Pet>> getPets(int pageIndex, {String? filterString});
}