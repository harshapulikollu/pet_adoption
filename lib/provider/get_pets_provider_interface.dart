import '../model/pet.dart';

abstract class GetPetsProviderInterface {
  Future<List<Pet>> getPets();
}