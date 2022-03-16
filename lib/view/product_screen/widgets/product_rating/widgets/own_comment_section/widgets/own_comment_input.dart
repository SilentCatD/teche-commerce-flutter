import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OwnCommentInput extends StatefulWidget {
  const OwnCommentInput({Key? key}) : super(key: key);

  @override
  State<OwnCommentInput> createState() => _OwnCommentInputState();
}

class _OwnCommentInputState extends State<OwnCommentInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Rate this product", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          RatingBar.builder(
            unratedColor: Colors.black54,
            itemCount: 5,
            initialRating: 0,
            maxRating: 5,
            minRating: 1,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rate) {
              print(rate);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Write your review...",
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("Submit")),
            ),
          )
        ],
      ),
    );
  }
}
