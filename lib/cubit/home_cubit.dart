import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/pet.dart';
import '../provider/get_pets_provider_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPetsProviderInterface getPetsProvider;

  HomeCubit({
    required this.getPetsProvider,
}) : super(HomeInitial()) {
    getPets(pageIndex: 0, filterString: '');
  }

  int _pageIndex = 0;
  String _filteredString = '';
  List<Pet> _pets = [];
  bool reachedLast = false;
  bool isLoading = false;

  Future<void> getPets({int? pageIndex, String? filterString}) async{
    emit(HomeLoading());
    if(!isLoading){
      isLoading = true;
      if(pageIndex != null){
        _pageIndex = pageIndex;
        _pets.clear();
        reachedLast = false;
      }else{
        _pageIndex++;
      }
      if(filterString != null){
        _filteredString = filterString;
        _pets.clear();
        reachedLast = false;
      }
      try{
        if(!reachedLast){
          final response  = await getPetsProvider.getPets(_pageIndex, filterString: _filteredString);
          if(response.length < 10){
            reachedLast = true;
          }
          _pets.addAll(response);
          isLoading = false;
          emit(HomeLoadedSuccessfully(responseApi: _pets));
        }
      }catch(e){
        debugPrint('error $e');
        isLoading = false;
        emit(HomeLoadingFailed());
      }
    }
  }
}
