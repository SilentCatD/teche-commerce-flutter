import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teche_commerce/controller/product_bloc/bloc/product_info_bloc.dart';
import 'package:teche_commerce/data/model/comment.dart';

import '../../../data/repository/data_repository.dart';

part 'product_comment_event.dart';

part 'product_comment_state.dart';

class ProductCommentBloc
    extends Bloc<ProductCommentEvent, ProductCommentState> {
  late final DataRepository _dataRepository;
  late final String _productId;
  final _commentLimit = 20;
  int _nextIndex = 0;
  final ProductInfoBloc productInfoBloc;

  ProductCommentBloc(
      {required DataRepository dataRepository,
      required String productId,
      required this.productInfoBloc})
      : super(ProductCommentInitial()) {
    _dataRepository = dataRepository;
    _productId = productId;
    on<ProductCommentFetch>(_onProductCommentFetch);
    productInfoBloc.stream.listen((state) {
      if (state is ProductLoaded) {
        add(ProductCommentFetch());
      }
    });
  }

  void _onProductCommentFetch(ProductCommentFetch event, Emitter emit) async {
    try {
      emit(ProductCommentLoading());
      final List<Comment> comments = await _dataRepository.fetchProductComment(
          _productId, _nextIndex, _commentLimit);
      _nextIndex = comments.length;
      emit(ProductCommentLoaded(comments));
    } catch (e) {
      emit(ProductCommentError());
    }
  }
}
