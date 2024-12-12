import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, this.title = 'RC-Workouts'});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
      ),
      backgroundColor: Colors.red,
      foregroundColor: Colors.black87,
      centerTitle: true,
    );
  }
}
