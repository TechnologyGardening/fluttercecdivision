import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int second = 0;
  late Timer timer;
  bool _isTicking = false;
  final laps = <int>[];
  final itemheight = 60;
  final abc = ScrollController();

  String _secondToText() {
    final seconds = millis / 1000;
    return '$seconds seconds';
  }

  int millis = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text('${_secondToText()}',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            const SizedBox(height: 20),
            Expanded(child: controlPanel()),
            const SizedBox(height: 20),
            Expanded(child: _builderDisplay()),
          ],
        ),
      ),
    );
  }

  Row controlPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _isTicking ? null : _startTimer,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Icon(Icons.start),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _pauseTimer,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Icon(_isTicking ? Icons.pause : Icons.play_arrow),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _isTicking ? _stopTimer : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Icon(Icons.stop),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _isTicking ? _lapclick : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Icon(Icons.timer),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _lapclick() {
    setState(() {
      laps.add(millis);
      millis = 0;
    });
    abc.animateTo(
      (itemheight * laps.length).toDouble(),
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        if (_isTicking) {
          millis += 100;
        }
      });
    }
  }

  String _secondToText1(int i1) {
    final seconds = i1 / 1000;
    return '$seconds seconds';
  }

  Widget _builderDisplay() {
    return ListView.builder(
      controller: abc,
      itemExtent: itemheight.toDouble(),
      itemCount: laps.length,
      itemBuilder: (context, index) {
        final i = laps[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          title: Text('Lap ${index + 1}'),
          trailing: Text(_secondToText1(i)),
        );
      },
    );
  }

  Widget _buildDisplay() {
    return Scrollbar(
      child: ListView(
        children: [
          for (int i in laps)
            ListTile(
              leading: const Icon(Icons.timer),
              title: Text(
                _secondToText1(i),
              ),
              trailing: const Text("Seconds"),
            ),
        ],
      ),
    );
  }

  void _pauseTimer() {
    setState(() {
      _isTicking = !_isTicking;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      _isTicking = true;
      second = 0;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      laps.clear();
      millis = 0;
      second = 0;
      _isTicking = false;
    });
  }
}
