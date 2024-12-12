import 'dart:async';

import 'package:flutter/material.dart';

class TimerCard extends StatefulWidget {
  final String title;
  final Duration duration;

  const TimerCard({
    super.key,
    required this.title,
    required this.duration,
  });

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  bool isTimerRunning = false;
  late Duration remainingDuration;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingDuration = widget.duration;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              remainingDuration.toString().split('.')[0],
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () => pauseTimer(),
                  icon: const Icon(Icons.pause),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isTimerRunning == true ? Colors.blue : Colors.red,
                      foregroundColor: Colors.white),
                  onPressed: () => startTimer(),
                  child: const Icon(Icons.play_arrow, size: 42),
                ),
                IconButton(
                  onPressed: () => resetTimer(),
                  icon: const Icon(Icons.stop),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    setState(() {
      isTimerRunning = true;
    });

    timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        if (remainingDuration > Duration.zero) {
          remainingDuration -= oneSec;
        } else {
          resetTimer();
        }
      }),
    );
  }

  void pauseTimer() {
    setState(() {
      isTimerRunning = false;
    });

    timer.cancel();
  }

  void resetTimer() {
    setState(() {
      isTimerRunning = false;
    });

    timer.cancel();
    remainingDuration = widget.duration;
  }
}
