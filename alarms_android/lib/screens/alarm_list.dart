import 'package:alarms_android/components/alarm_list_item.dart';
import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/data.dart';
import 'package:alarms_android/screens/create_alarm.dart';
import 'package:alarms_android/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlarmListPage extends StatelessWidget {
  const AlarmListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Mis Alarmas",
        colorScheme: colorScheme,
        textTheme: textTheme,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.schedule, color: colorScheme.onSurface),
          ),
          IconButton(
            onPressed: () {
              context.go(CreateAlarmPage.route);
            },
            icon: Icon(Icons.add_circle_outline, color: colorScheme.onSurface),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: alarmsByCategory.length,
        itemBuilder: (context, index) {
          final MapEntry(key: categoryTitle, value: alarms) =
              alarmsByCategory[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                categoryTitle,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              for (final alarm in alarms)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AlarmListItem(alarm),
                ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
