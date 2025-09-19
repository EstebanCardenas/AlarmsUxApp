import 'package:alarms_android/models/days.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DayBadge extends StatelessWidget {
  final Day day;
  final bool toggled;

  const DayBadge({super.key, required this.day, required this.toggled});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Badge(
      label: Text(
        day.name,
        style: textTheme.labelSmall?.copyWith(
          color: toggled ? colorScheme.onPrimary : colorScheme.onSurface,
        ),
      ),
      backgroundColor: toggled
          ? colorScheme.onPrimaryContainer
          : colorScheme.surface,
    );
  }
}
