import 'package:alarms_android/screens/confirm_alarm.dart';
import 'package:alarms_android/screens/create_alarm.dart';
import 'package:alarms_android/themes.dart';
import 'package:alarms_android/screens/alarm_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const AlarmsApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: AlarmListPage.name,
      builder: (context, state) => AlarmListPage(),
      routes: [
        GoRoute(
          path: CreateAlarmPage.route,
          name: CreateAlarmPage.name,
          builder: (context, state) => CreateAlarmPage(),
          routes: [
            GoRoute(
              path: ConfirmAlarmPage.route,
              name: ConfirmAlarmPage.name,
              builder: (context, state) => ConfirmAlarmPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class AlarmsApp extends StatelessWidget {
  const AlarmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alarms App',
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
