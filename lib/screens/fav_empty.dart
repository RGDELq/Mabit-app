import 'package:flutter/material.dart';

class WishlistEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<>(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
        ),
        Text(
          'Your favourite screen Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 44, 73, 121),
              fontSize: 26,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Explore more properties',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
