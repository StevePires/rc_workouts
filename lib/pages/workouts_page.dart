import 'package:flutter/material.dart';
import 'package:rc_workouts/widgets/my_app_bar.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Workouts'),
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
                  'Lightweight Baby!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(height: 32),
                ...getWorkouts(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addWorkout,
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }

  void addWorkout() {
    // Add Workout logic here
  }

  List<Widget> getWorkouts() {
    return <Widget>[
      // const WorkoutCard(
      //   title: 'Workout 1',
      //   duration: Duration(minutes: 1),
      // ),
      // const SizedBox(height: 8),
      // const WorkoutCard(
      //   title: 'Workout 2',
      //   duration: Duration(minutes: 1, seconds: 30),
      // ),
      // const SizedBox(height: 8),
      // const WorkoutCard(
      //   title: 'Workout 3',
      //   duration: Duration(minutes: 2),
      // ),
      // const SizedBox(height: 8),
      // const WorkoutCard(
      //   title: 'Workout 4',
      //   duration: Duration(minutes: 2, seconds: 30),
      // ),
      // const SizedBox(height: 8),
      // const WorkoutCard(
      //   title: 'Workout 5',
      //   duration: Duration(minutes: 3),
      // ),
    ];
  }
}
