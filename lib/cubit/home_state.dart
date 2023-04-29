part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedSuccessfully extends HomeState {
  final List<Pet> responseApi;

  const HomeLoadedSuccessfully({required this.responseApi});
  @override
  List<Object?> get props => [responseApi];
}

class HomeLoadingFailed extends HomeState {
  @override
  List<Object?> get props => [];
}