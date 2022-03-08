import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';

part 'highlight_product_event.dart';

part 'highlight_product_state.dart';

class HighlightProductBloc
    extends Bloc<HighlightProductEvent, HighlightProductState> {
  HighlightProductBloc({required DataRepository dataRepository})
      : super(HighlightProductInitial()) {
    _dataRepository = dataRepository;

    on<HighLightProductFetch>(_onHighLightProductFetch);
  }

  late final DataRepository _dataRepository;

  void _onHighLightProductFetch(
      HighLightProductFetch event, Emitter emit) async {
    emit(HighlightProductLoading());
    try {
      final data = await _dataRepository.fetchHighLightProduct();
      emit(HighlightProductLoaded(data));
    } catch (e) {
      emit(HighlightProductError());
    }
  }
}
