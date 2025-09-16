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
      builder: (context, state) => AlarmListPage(),
      routes: [
        GoRoute(
          path: CreateAlarmPage.route,
          builder: (context, state) => CreateAlarmPage(),
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
