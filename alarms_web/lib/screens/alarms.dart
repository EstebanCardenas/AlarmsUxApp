import 'package:alarms_web/components/alarm_item.dart';
import 'package:alarms_web/components/app_bar.dart';
import 'package:alarms_web/screens/create_category.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            title: "Alarmas",
            action: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => context.goNamed(CreateCategoryPage.name),
              icon: Icon(Icons.add_circle_outline,
                  color: colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
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
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AlarmItem(hour: 6, minute: 0, meridiemType: "AM"),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 7, minute: 0, meridiemType: "AM"),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 8, minute: 0, meridiemType: "AM"),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 9, minute: 0, meridiemType: "AM"),
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
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AlarmItem(hour: 6, minute: 30, meridiemType: "AM"),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 7, minute: 30, meridiemType: "AM"),
                        const SizedBox(height: 8),
                        AlarmItem(hour: 8, minute: 30, meridiemType: "AM"),
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
