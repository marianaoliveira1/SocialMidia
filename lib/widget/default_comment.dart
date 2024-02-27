import 'package:flutter/material.dart';

class DefaultComment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  const DefaultComment({
    super.key,
    required this.text,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(text),
          Row(
            children: [
              Text(user),
              const Text(" - "),
              Text(time),
            ],
          )
        ],
      ),
    );
  }
}
