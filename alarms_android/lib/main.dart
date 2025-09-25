import 'package:alarms_android/screens/confirm_alarm.dart';
import 'package:alarms_android/screens/create_alarm.dart';
import 'package:alarms_android/screens/alarm_list.dart';
import 'package:alarms_android/screens/history.dart';
import 'package:alarms_android/screens/home_menu.dart';
import 'package:alarms_android/screens/snooze.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:design_system/design_system.dart';

import 'screens/notification_action.dart';

void main() {
  runApp(const AlarmsApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: HomeMenuPage.name,
      builder: (context, state) => HomeMenuPage(),
      routes: [
        GoRoute(
          path: AlarmListPage.route,
          name: AlarmListPage.name,
          builder: (context, state) => AlarmListPage(),
          routes: [
            GoRoute(
              path: "/history",
              name: HistoryPage.name,
              builder: (context, state) => HistoryPage(),
              routes: [],
            ),
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
        GoRoute(
          path: "/notification_action",
          name: NotificationActionPage.name,
          builder: (context, state) => NotificationActionPage(),
          routes: [
            GoRoute(
              path: "/snooze",
              name: SnoozePage.name,
              builder: (context, state) => SnoozePage(),
              routes: [],
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
