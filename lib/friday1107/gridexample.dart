import 'package:flutter/material.dart';

class CalculatorExmp extends StatelessWidget {
  const CalculatorExmp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          color: const Color.fromARGB(255, 233, 239, 242),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("1"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("1"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("2"),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("1"),
                      ),
                    )
                  ],
                ),
                Text("Text2"),
                Text("Text1"),
                Text("Text2"),
                Text("Text1"),
                Text("Text2"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
