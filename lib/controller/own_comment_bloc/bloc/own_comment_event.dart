part of 'own_comment_bloc.dart';

@immutable
abstract class OwnCommentEvent {}

class OwnCommentFetch extends OwnCommentEvent {}

class OwnCommentSubmit extends OwnCommentEvent {
  final String text;
  final int rate;

  OwnCommentSubmit({required this.rate, required this.text});
}
