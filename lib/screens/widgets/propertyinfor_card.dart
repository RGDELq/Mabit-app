import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_mode_provider.dart';

Widget specWidget(BuildContext context, IconData iconData, String text,
    {required Color color}) {
  final dakmode = Provider.of<DarkModeProvider>(context);
  return Consumer<DarkModeProvider>(
    builder: (context, dmc, child) {
      return Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: dakmode.isDark ? secprimary : darkblue,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: dmc.isDark ? Colors.white : Colors.black,
                  ),
            ),
          ],
        ),
      );
    },
  );
}
