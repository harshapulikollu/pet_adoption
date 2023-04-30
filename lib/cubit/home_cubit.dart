import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../model/pet.dart';
import '../repository/get_pets_repository_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPetsInterface _getPetsRepository;
  HomeCubit(
    this._getPetsRepository,
  ) : super(HomeInitial()) {
    getPets(pageIndex: 0, filterString: '');
  }

  int _pageIndex = 0;
  String _filteredString = '';
  late List<Pet> _pets;
  bool _reachedLast = false;
  bool _isLoading = false;

  bool get reachedLast => _reachedLast;
  bool get isLoading => _isLoading;

  Future<void> getPets({int? pageIndex, String? filterString}) async {
    _pets = [];
    emit(HomeLoading());
    if (!_isLoading) {
      _isLoading = true;
      if (pageIndex != null) {
        _pageIndex = pageIndex;
        _pets.clear();
        _reachedLast = false;
      } else {
        _pageIndex++;
      }
      if (filterString != null) {
        _filteredString = filterString;
        _pets.clear();
        _reachedLast = false;
      }
      try {
        if (!_reachedLast) {
          final response = await _getPetsRepository.getPets(_pageIndex,
              filterString: _filteredString);
          if (response.length < 10) {
            _reachedLast = true;
          }
          _pets.addAll(response);
          _isLoading = false;
          emit(HomeLoadedSuccessfully(responseApi: _pets));
        }
      } catch (e) {
        debugPrint('error $e');
        _isLoading = false;
        emit(HomeLoadingFailed());
      }
    }
  }
}
