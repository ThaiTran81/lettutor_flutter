import 'dart:async';

import 'package:flutter/cupertino.dart';

class CountDownTimer extends StatefulWidget {
  final int seconds;
  TextStyle? textStyle;

  CountDownTimer({super.key, required this.seconds, this.textStyle});

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String hours = (_secondsRemaining ~/ 3600).toString().padLeft(2, '0');
    String minutes =
        ((_secondsRemaining % 3600) ~/ 60).toString().padLeft(2, '0');
    String seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return Text(
      '$hours:$minutes:$seconds',
      style: widget.textStyle ?? TextStyle(fontSize: 24.0),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
