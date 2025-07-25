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
            Text('${_secondToText()}',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            controlPanel()
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
          child: const Text('Start'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _pauseTimer,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(_isTicking ? 'Pause' : 'Resume'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _isTicking ? _stopTimer : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Text('Stop'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
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
      millis = 0;
      second = 0;
      _isTicking = false;
    });
  }
}
