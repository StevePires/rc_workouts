import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const HomeCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.routeName});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.routeName);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(widget.icon),
              Expanded(
                child: Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
