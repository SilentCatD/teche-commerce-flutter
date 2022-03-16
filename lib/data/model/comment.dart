class Comment {
  late final String commentId;
  late final String productId;
  late final String userId;
  late final String userAvatar;
  late  final String userName;
  late final int rate;
  late final String text;
  late final int vote;

  Comment({
    required this.commentId,
    required this.productId,
    required this.rate,
    required this.text,
    required this.userAvatar,
    required this.userId,
    required this.userName,
    required this.vote,
  });

  Comment.fromJSON(Map<String, dynamic> commentData){
    commentId = commentData['commentId'];
    productId = commentData['productId'];
    userId = commentData['userId'];
    userName = commentData['userName'];
    rate = commentData['rate'];
    userAvatar = commentData['userAvatar'];
    text = commentData['text'];
    vote = commentData['vote'];
  }

}
