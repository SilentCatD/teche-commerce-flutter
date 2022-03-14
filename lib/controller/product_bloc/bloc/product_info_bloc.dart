import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';

import '../../../data/model/product.dart';

part 'product_info_event.dart';
part 'product_info_state.dart';

class ProductInfoBloc extends Bloc<ProductEvent, ProductState> {

  late final DataRepository _dataRepository;
  late final String _productId;

  ProductInfoBloc({required DataRepository dataRepository, required String productId}) : super(ProductInitial()) {
    _dataRepository = dataRepository;
    _productId = productId;
    on<FetchProduct>(_onFetchProduct);
  }

  void _onFetchProduct(FetchProduct event, Emitter emit) async{
    emit(ProductLoading());
    try{
      final product = await _dataRepository.fetchProduct(_productId);
      emit(ProductLoaded(product));
    }catch (e){
      emit(ProductError());
    }
  }
}
