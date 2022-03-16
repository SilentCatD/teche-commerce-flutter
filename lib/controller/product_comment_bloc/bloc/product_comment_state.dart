part of 'product_comment_bloc.dart';

@immutable
abstract class ProductCommentState {}

class ProductCommentInitial extends ProductCommentState {}

class ProductCommentLoading extends ProductCommentState{}

class ProductCommentLoaded extends ProductCommentState {
  final List<Comment> comments;
  ProductCommentLoaded(this.comments);
}

class ProductCommentError extends ProductCommentState {}