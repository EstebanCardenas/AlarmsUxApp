import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SnoozePage extends StatelessWidget {
  static const String name = 'SnoozePage';

  const SnoozePage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Mi alarma",
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Postponer",
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 96),
                  buildSnoozeOption("1 minuto", colorScheme, textTheme),
                  const SizedBox(height: 54),
                  buildSnoozeOption("5 minutos", colorScheme, textTheme),
                  const SizedBox(height: 54),
                  buildSnoozeOption("10 minutos", colorScheme, textTheme),
                  const SizedBox(height: 54),
                  buildSnoozeOption("30 minutos", colorScheme, textTheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSnoozeOption(
  String label,
  ColorScheme colorScheme,
  TextTheme textTheme,
) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.stars, color: colorScheme.onSecondaryContainer),
    label: Text(
      label,
      style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 4, // sombra ligera
    ),
  );
}
