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
              constraints: BoxConstraints(),
              onPressed: () => context.goNamed(CreateCategoryPage.name),
              icon: Icon(Icons.add_circle_outline, color: colorScheme.onSurfaceVariant),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24, bottom: 16),
                child: Text(
                  "Las más frecuentes",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    AlarmItem(hour: 6, minute: 0, meridiemType: "AM"),
                    SizedBox(width: 8, height: 8),
                    AlarmItem(hour: 7, minute: 0, meridiemType: "AM"),
                    SizedBox(width: 8, height: 8),
                    AlarmItem(hour: 8, minute: 0, meridiemType: "AM"),
                    SizedBox(width: 8, height: 8),
                    AlarmItem(hour: 9, minute: 0, meridiemType: "AM"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
