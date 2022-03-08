import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.text, required this.onPress}) : super(key: key);
  final String text;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(onPressed: onPress, child: const Text("See More")),
      ],
    );
  }
}
