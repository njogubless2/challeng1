import 'package:flutter/material.dart';

class QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickAccessButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          child: Icon(icon),
        ),
        const SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}
