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
    getPets(0, filterString: '');
  }

  Future<void> getPets(int pageIndex, {String? filterString}) async{
    emit(HomeLoading());
    try{
      final response  = await getPetsProvider.getPets(pageIndex, filterString: filterString);
      emit(HomeLoadedSuccessfully(responseApi: response));
    }catch(e){
      emit(HomeLoadingFailed());
    }
  }
}
