import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class AlarmItem extends StatelessWidget {
  final int hour;
  final int minute;
  final String meridiemType;

  const AlarmItem({
    super.key,
    required this.hour,
    required this.minute,
    required this.meridiemType,
  });

  String get formattedHour {
    String minuteStr = minute < 10 ? '0$minute' : '$minute';

    return "$hour:$minuteStr $meridiemType";
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 18,
                ),
                child: Text(
                  formattedHour,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8, width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alarma 1",
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet",
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.delete, size: 16, color: colorScheme.onSurfaceVariant),
                    SizedBox(width: 4),
                    Text(
                      "Eliminar",
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),                
              ],
            ),
          ],
        ),
      ],
    );

    /*
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            child: Text(
              formattedHour,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimaryContainer),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Lun, Mar, Mié",
          style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );

    */
  }
}
