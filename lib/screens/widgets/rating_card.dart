import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';

class ReviewUI extends StatelessWidget {
  final String name;
  final int ptoperty_id;
  final String createdAt;
  final String updateded_at;

  const ReviewUI({
    required Key key,
    required this.name,
    required this.ptoperty_id,
    required this.createdAt,
    required this.updateded_at,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 1.0,
        bottom: 2.0,
        left: 16.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 45.0,
                width: 40.0,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44.0),
                ),
              ),
         
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const SizedBox(width: 100),
              Text(
                createdAt,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
              onTap: () {},
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                  color: darkcolor,
                ),
              )),
        ],
      ),
    );
  }
}
