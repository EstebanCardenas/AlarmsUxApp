import 'package:alarms_android/models/alarm.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class HourPill extends StatelessWidget {
  final int hour;
  final int minute;
  final MeridiemType meridiemType;

  const HourPill({
    super.key,
    required this.hour,
    required this.minute,
    required this.meridiemType,
  });

  String get formattedHour {
    String minuteStr = minute < 10 ? '0$minute' : '$minute';

    return "$hour:$minuteStr${meridiemType.name}";
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          formattedHour,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onPrimary),
        ),
      ),
    );
  }
}
