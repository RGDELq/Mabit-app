import 'package:flutter/material.dart';

Widget specWidget(BuildContext context, IconData iconData, String text) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 219, 232, 216),
            shape: BoxShape.circle,
          ),
          child: Icon(iconData),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    ),
  );
}
