import 'package:flutter/material.dart';
import 'package:rc_workouts/widgets/my_app_bar.dart';
import 'package:rc_workouts/widgets/workout_card.dart';

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
    const workoutList = [
      'Squats',
      'Push ups',
      'Pull ups',
      'Muscle Ups',
      'Abs',
      'Chin ups',
      'Dips'
    ];
    return List.from(workoutList).map((workout) {
      return WorkoutCard(
        title: workout,
      );
    }).toList();
  }
}
