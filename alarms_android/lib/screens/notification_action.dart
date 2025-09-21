import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/screens/alarm_list.dart';
import 'package:alarms_android/screens/snooze.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationActionPage extends StatelessWidget {
  static const String name = 'NotificationActionPage';

  const NotificationActionPage({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de sección
            Text(
              "Acciones",
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 12),
            // Botones alineados a la izquierda y con wrap si no caben
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => context.goNamed(SnoozePage.name),
                  icon: Icon(Icons.star, size: 18, color: colorScheme.onPrimary),
                  label: Text(
                    "Postponer",
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => context.goNamed(AlarmListPage.name),
                  icon: Icon(Icons.star,
                      size: 18, color: colorScheme.onSecondaryContainer),
                  label: Text(
                    "Hecho",
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondaryContainer,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
