part of 'own_comment_bloc.dart';

@immutable
abstract class OwnCommentState {}

class OwnCommentInitial extends OwnCommentState {}

class OwnCommentLoading extends OwnCommentState {}

class OwnCommentLoaded extends OwnCommentState {
  final Comment comment;

  OwnCommentLoaded(this.comment);
}

class OwnCommentNotExist extends OwnCommentState {}

class OwnCommentError extends OwnCommentState {}
