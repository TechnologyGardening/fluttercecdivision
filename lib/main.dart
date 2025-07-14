import 'package:flutter/material.dart';
import 'package:fluttercecdivision/friday1107/first_experiment.dart';
import 'package:fluttercecdivision/friday1107/gridexample.dart';
import 'package:fluttercecdivision/friday1107/paddingcocept.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorExmp(),
    );
  }
}
