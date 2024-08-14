import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? amount;
  final String? frequency;
  final String? startDate;
  final String? fee;
  final String? status;
  final String? nextDue;
  final String? buttonText;
  final String? iconPath;
  final Widget? actions;

  const CustomCard({
    super.key,
    required this.title,
    this.subtitle,
    this.amount,
    this.frequency,
    this.startDate,
    this.fee,
    this.status,
    this.nextDue,
    this.buttonText,
    this.iconPath,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconPath != null)
              Row(
                children: [
                  Image.asset(iconPath!, height: 24, width: 24),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            else
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            if (subtitle != null) Text(subtitle!),
            if (amount != null)
              Text(
                amount!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            if (frequency != null || startDate != null)
              Text('Frequency: $frequency | Start date: $startDate'),
            if (fee != null) Text('Fee: $fee'),
            if (status != null)
              Text('Status: $status',
                  style: const TextStyle(color: Colors.red)),
            if (nextDue != null) Text('Next due: $nextDue'),
            if (buttonText != null)
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.edit),
                    const SizedBox(width: 8),
                    Text(buttonText!),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
