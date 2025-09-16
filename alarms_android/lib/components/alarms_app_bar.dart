import 'package:flutter/material.dart';

class AlarmsAppBar extends AppBar {
  AlarmsAppBar({
    super.key,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    required String title,
    super.actions,
  }) : super(
         title: Text(title, style: textTheme.titleLarge),
         backgroundColor: colorScheme.surfaceContainer,
       );
}
