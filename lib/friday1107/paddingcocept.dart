import 'package:flutter/material.dart';
import 'package:fluttercecdivision/friday1107/textlayoutexample.dart';

class PadddingExample extends StatelessWidget {
  const PadddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.blue,
                  child: const TextLayout(),
                  // child: const Center(child: Text("Hello")),
                ),
              ),
            ),
          )),
    );
  }
}
