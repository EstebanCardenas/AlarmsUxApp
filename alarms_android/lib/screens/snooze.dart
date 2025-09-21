import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/screens/history.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnoozePage extends StatelessWidget {
  static const String name = 'SnoozePage';

  const SnoozePage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);
    
    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Postponer",
        colorScheme: colorScheme,
        textTheme: textTheme),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSnoozeOption("1 minuto", colorScheme.primary, colorScheme, textTheme),
            const SizedBox(height: 10),
            buildSnoozeOption("5 minutos", colorScheme.primary, colorScheme, textTheme),
            const SizedBox(height: 10),
            buildSnoozeOption("10 minutos", colorScheme.primary, colorScheme, textTheme),
            const SizedBox(height: 10),
            buildSnoozeOption("30 minutos", colorScheme.primary, colorScheme, textTheme),
          ],
        ),
      ),
    );
  }
}

Widget buildSnoozeOption(
  String label,
  Color iconColor,
  ColorScheme colorScheme,
  TextTheme textTheme,
) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.star, color: iconColor),
    label: Text(
      label,
      style: textTheme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- esquinas redondeadas
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 4, // sombra ligera
    ),
  );
}