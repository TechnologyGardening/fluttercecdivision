import 'package:flutter/material.dart';

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "This is a simple text layout example.",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(height: 40),
        Text(
          "You can use different styles and alignments.",
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
        SizedBox(height: 40),
        Text(
          "Flutter makes it easy to create beautiful UIs.",
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
      ],
    );
  }
}
