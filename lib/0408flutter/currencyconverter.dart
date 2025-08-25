import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  double c1 = 0, c2 = 0;
  int i1 = 1, i2 = 0;
  String s1 = "", s2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: t1,
              onChanged: (value) => {
                setState(() {
                  c1 = double.parse(t1.text.toString());
                })
              },
              decoration: const InputDecoration(label: Text("Currency1")),
            ),
            TextField(
              controller: t2,
              decoration: const InputDecoration(label: Text("Currency2")),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: convertcurrency,
              child: const Text("Convert"),
            ),
            const SizedBox(
              height: 20,
            ),
            c1Part(),
            const SizedBox(
              height: 20,
            ),
            c2Part(),
          ],
        ),
      ),
    ));
  }

  Container c1Part() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                  value: "INR",
                  groupValue: s1,
                  onChanged: (v1) => {
                        setState(() {
                          i1 = 1;
                          s1 = "INR";
                        })
                      }),
              Text("INR"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "USD",
                  groupValue: s1,
                  onChanged: (v1) => {
                        setState(() {
                          i1 = 2;
                          s1 = "USD";
                        })
                      }),
              Text("USD"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "YEN",
                  groupValue: s1,
                  onChanged: (v1) => {
                        setState(() {
                          i1 = 3;
                          s1 = "YEN";
                        })
                      }),
              Text("YEN"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "EURO",
                  groupValue: s1,
                  onChanged: (v1) => {
                        setState(() {
                          i1 = 4;
                          s1 = "EURO";
                        })
                      }),
              Text("EURO"),
            ],
          )
        ],
      ),
    );
  }

  Container c2Part() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                  value: "INR",
                  groupValue: s2,
                  onChanged: (v1) => {
                        setState(() {
                          i2 = 1;
                          s2 = "INR";
                        })
                      }),
              Text("INR"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "USD",
                  groupValue: s2,
                  onChanged: (v1) => {
                        setState(() {
                          i2 = 2;
                          s2 = "USD";
                        })
                      }),
              Text("USD"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "YEN",
                  groupValue: s2,
                  onChanged: (v1) => {
                        setState(() {
                          i2 = 3;
                          s2 = "YEN";
                        })
                      }),
              Text("YEN"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "EURO",
                  groupValue: s2,
                  onChanged: (v1) => {
                        setState(() {
                          i2 = 4;
                          s2 = "EURO";
                        })
                      }),
              Text("EURO"),
            ],
          )
        ],
      ),
    );
  }

  void convertcurrency() {
    if (i1 == 1 && i2 == 1) {
      t2.text = c1.toString();
    }

    if (i1 == 1 && i2 == 2) {
      t2.text = (c1 * 0.013).toString();
    }
    if (i1 == 1 && i2 == 3) {
      t2.text = (c1 * 0.11).toString();
    }
    if (i1 == 1 && i2 == 4) {
      t2.text = (c1 * 0.012).toString();
    }
    if (i1 == 2 && i2 == 1) {
      t2.text = (c1 * 77.18).toString();
    }
    if (i1 == 2 && i2 == 2) {
      t2.text = c1.toString();
    }
    if (i1 == 2 && i2 == 3) {
      t2.text = (c1 * 8.36).toString();
    }
    if (i1 == 2 && i2 == 4) {
      t2.text = (c1 * 0.88).toString();
    }
    if (i1 == 3 && i2 == 1) {
      t2.text = (c1 * 9.06).toString();
    }
    if (i1 == 3 && i2 == 2) {
      t2.text = (c1 * 0.12).toString();
    }
    if (i1 == 3 && i2 == 3) {
      t2.text = c1.toString();
    }
    if (i1 == 3 && i2 == 4) {
      t2.text = (c1 * 0.009).toString();
    }
    if (i1 == 4 && i2 == 1) {
      t2.text = (c1 * 83.35).toString();
    }
    if (i1 == 4 && i2 == 2) {
      t2.text = (c1 * 1.13).toString();
    }
    if (i1 == 4 && i2 == 3) {
      t2.text = (c1 * 111.39).toString();
    }
    if (i1 == 4 && i2 == 4) {
      t2.text = c1.toString();
    }
  }
}
