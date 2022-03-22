import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teche_commerce/data/model/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.comment}) : super(key: key);
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor..withOpacity(0.7))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  NetworkImage(comment.userAvatar)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(comment.userName),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Center(
                        child: RatingBarIndicator(
                          itemBuilder: (BuildContext context, int index) =>
                              const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.black54,
                          rating: comment.rate.toDouble(),
                          itemSize: 20,
                        ),
                      ),
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(comment.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
