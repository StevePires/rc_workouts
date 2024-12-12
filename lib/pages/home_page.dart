import 'package:flutter/material.dart';
import 'package:rc_workouts/routes/main_routes.dart';
import 'package:rc_workouts/widgets/home_card.dart';
import 'package:rc_workouts/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Yeeaahh Buddy!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                SizedBox(height: 32),
                HomeCard(
                  title: 'Timers',
                  icon: Icons.timer,
                  routeName: MainRoutes.timers,
                ),
                HomeCard(
                  title: 'Workouts',
                  icon: Icons.fitness_center,
                  routeName: MainRoutes.workouts,
                ),
                HomeCard(
                  title: 'Sally Up!',
                  icon: Icons.military_tech,
                  routeName: MainRoutes.sallyUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
