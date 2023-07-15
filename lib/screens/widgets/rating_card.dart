import 'package:flutter/material.dart';

class ReviewUI extends StatelessWidget {
  final String name;
  final String createdAt;
  final String updateded_at;
  final int ptoperty_id;
  final Key key;

  const ReviewUI({
    required this.name,
    required this.createdAt,
    required this.updateded_at,
    required this.ptoperty_id,
    required this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            createdAt,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          // const SizedBox(height: 8.0),
          // Text(
          //   updateded_at,
          //   style: const TextStyle(
          //     fontSize: 14.0,
          //     color: Colors.grey,
          //   ),
          // ),
          const SizedBox(height: 8.0),
          // Text(
          //   ptoperty_id.toString(),
          //   style: const TextStyle(
          //     fontSize: 14.0,
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
