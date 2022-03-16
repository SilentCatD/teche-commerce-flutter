import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teche_commerce/data/model/comment.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';

part 'own_comment_event.dart';

part 'own_comment_state.dart';

class OwnCommentBloc extends Bloc<OwnCommentEvent, OwnCommentState> {
  late final DataRepository _dataRepository;
  late final String _productId;

  OwnCommentBloc(
      {required DataRepository dataRepository, required String productId})
      : super(OwnCommentInitial()) {
    _dataRepository = dataRepository;
    _productId = productId;
    on<OwnCommentFetch>(_onOwnCommentFetch);
    on<OwnCommentSubmit>(_onOwnCommentSubmit);
  }

  void _onOwnCommentFetch(OwnCommentFetch event, Emitter emit) async {
    emit(OwnCommentLoading());
    try {
      final Comment? comment = await _dataRepository.fetchOwnComment(
          _productId, "use the user id from user bloc here");
      if (comment != null) {
        emit(OwnCommentLoaded(comment));
      } else {
        emit(OwnCommentNotExist());
      }
    } catch (e) {
      emit(OwnCommentError());
    }
  }

  void _onOwnCommentSubmit(OwnCommentSubmit event, Emitter emit) async {
    try {
      emit(OwnCommentLoading());
      await _dataRepository.postComment(
          _productId, "user id", event.text, event.rate);
      add(OwnCommentFetch());
    } catch (e) {
      emit(OwnCommentError());
    }
  }
}
