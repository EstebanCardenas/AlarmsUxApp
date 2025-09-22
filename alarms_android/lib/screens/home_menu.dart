import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/screens/alarm_list.dart';
import 'package:alarms_android/screens/history.dart';
import 'package:alarms_android/screens/notification_action.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeMenuPage extends StatelessWidget {
  static const String name = 'HomeMenuPage';
  
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);
    
    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Home",
        colorScheme: colorScheme,
        textTheme: textTheme),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed(AlarmListPage.name),
              child: const Text('Lista de alarmas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.goNamed(NotificationActionPage.name),
              child: const Text('Simular notificación'),
            ),
          ],
        ),
      ),
    );
  }
}
