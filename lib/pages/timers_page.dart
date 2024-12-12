import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:rc_workouts/widgets/my_app_bar.dart';
import 'package:rc_workouts/widgets/timer_card.dart';

class TimersPage extends StatefulWidget {
  const TimersPage({super.key});

  @override
  State<TimersPage> createState() => _TimersPageState();
}

class _TimersPageState extends State<TimersPage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    isLoading = false;
    // This is to test the Skeletonizer widget

    // Future.delayed(const Duration(seconds: 2), () {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });

    return Scaffold(
      appBar: const MyAppBar(title: 'Timers'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Ain't nothin' but a peanut!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(height: 32),
                Skeletonizer(
                  enabled: isLoading,
                  child: Center(
                    child: Column(
                      children: <Widget>[...getTimers()],
                    ),
                  ),
                ),
                // ...getTimers(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTimer,
        tooltip: 'Add Timer',
        child: const Icon(Icons.add),
      ),
    );
  }

  void addTimer() {
    // Add timer logic here
  }

  List<Widget> getTimers() {
    return <Widget>[
      const TimerCard(
        title: 'Workout 1',
        duration: Duration(minutes: 1, seconds: 30),
      ),
      const SizedBox(height: 8),
      const TimerCard(
        title: 'Workout 2',
        duration: Duration(minutes: 2, seconds: 30),
      ),
      const SizedBox(height: 8),
      const TimerCard(
        title: 'Workout 3',
        duration: Duration(minutes: 3),
      ),
    ];
  }
}
