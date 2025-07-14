import 'package:flutter/material.dart';

class LayoutExperiment extends StatelessWidget {
  const LayoutExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: null,
                child: Text("1"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: null,
                child: Text("1"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
