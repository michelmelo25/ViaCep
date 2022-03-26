import 'package:flutter/material.dart';

class TextLineWidget extends StatelessWidget {
  final String title;
  final String text;
  const TextLineWidget({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: "),
          Text(text),
        ],
      ),
    );
  }
}
