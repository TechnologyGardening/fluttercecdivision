import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Column(
      children: [
        Text(
          "First Element",
          style: TextStyle(
            fontSize: 20,
            color: Colors.teal,
          ),
        ),
        Text(
          "Second Element",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        Text(
          "Third Element",
          style: TextStyle(fontSize: 20),
        ),
        Text("Fourth Element"),
        Text("Fifth Element"),
        Text("Sixth Element"),
      ],
    ));
  }
}
