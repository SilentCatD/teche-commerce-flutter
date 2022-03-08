import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/brand.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';

part 'top_brands_event.dart';

part 'top_brands_state.dart';

class TopBrandsBloc extends Bloc<TopBrandsEvent, TopBrandsState> {
  TopBrandsBloc({required DataRepository dataRepository})
      : super(TopBrandsInitial()) {
    _dataRepository = dataRepository;

    on<TopBrandsFetch>(_onTopBrandsFetch);
  }

  late final DataRepository _dataRepository;

  void _onTopBrandsFetch(TopBrandsFetch event, Emitter emit) async {
    emit(TopBrandsFetching());
    try {
      final brands = await _dataRepository.fetchTopBrands();
      emit(TopBrandsFetched(brands: brands));
    } catch (e) {
      emit(TopBrandsFetchError());
    }
  }
}
