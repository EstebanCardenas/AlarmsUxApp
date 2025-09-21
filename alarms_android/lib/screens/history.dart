import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/components/history_list_item.dart';
import 'package:alarms_android/data.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class HistoryPage extends StatelessWidget {
  static const name = "history";

  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Historial",
        colorScheme: colorScheme,
        textTheme: textTheme,
        actions: [
          
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
                  child: HistoryListItem(alarm),
                ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
