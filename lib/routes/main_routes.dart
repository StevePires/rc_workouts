import 'package:flutter/material.dart';
import 'package:rc_workouts/pages/calendar_page.dart';
import 'package:rc_workouts/pages/home_page.dart';
import 'package:rc_workouts/pages/sally_up_page.dart';
import 'package:rc_workouts/pages/timers_page.dart';
import 'package:rc_workouts/pages/workouts_page.dart';

class MainRoutes {
  static const String home = '/home';
  static const String timers = '/timers';
  static const String workouts = '/workouts';
  static const String sallyUp = '/sallyUp';
  static const String calendar = '/calendar'; // Nouvelle route

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
      timers: (context) => const TimersPage(),
      workouts: (context) => const WorkoutsPage(),
      sallyUp: (context) => const SallyUpPage(),
      calendar: (context) => const CalendarPage(), // Nouvelle route
    };
  }
}
