import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/pet.dart';
import '../provider/get_pets_provider_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPetsProviderInterface getPetsProvider;

  HomeCubit({
    required this.getPetsProvider,
}) : super(HomeInitial()) {
    getPets();
  }

  Future<void> getPets() async{
    emit(HomeLoading());
    try{
      final response  = await getPetsProvider.getPets();
      emit(HomeLoadedSuccessfully(responseApi: response));
    }catch(e){
      emit(HomeLoadingFailed());
    }
  }
}
