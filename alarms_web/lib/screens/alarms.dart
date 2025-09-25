import 'package:alarms_web/components/alarm_item.dart';
import 'package:alarms_web/components/app_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AlarmsPage extends StatelessWidget {
  static final name = "alarms";
  static final route = "/$name";

  const AlarmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlarmsAppBar(
            title: "Mis Alarmas",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna: Las más frecuentes
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Las más frecuentes",
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 6, minute: 0, meridiemType: "am"),
                        const SizedBox(height: 16),
                        AlarmItem(hour: 7, minute: 0, meridiemType: "am"),
                        const SizedBox(height: 16),
                        AlarmItem(hour: 8, minute: 0, meridiemType: "am"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Columna: Eventos familiares
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eventos familiares",
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 6, minute: 30, meridiemType: "am"),
                        const SizedBox(height: 16),
                        AlarmItem(hour: 7, minute: 30, meridiemType: "am"),
                        const SizedBox(height: 16),
                        AlarmItem(hour: 8, minute: 30, meridiemType: "am"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
