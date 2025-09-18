import 'package:alarms_web/components/nav_rail.dart';
import 'package:alarms_web/screens/categories.dart';
import 'package:alarms_web/screens/dashboard.dart';
import 'package:alarms_web/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:design_system/design_system.dart';

void main() {
  runApp(const AlarmsApp());
}

final routeToIndex = {
  DashboardPage.route: 0,
  CategoriesPage.route: 1,
  SettingsPage.route: 2,
};

void destinationChangedHandler(BuildContext context, int idx) {
  switch (idx) {
    case 0:
      context.goNamed(DashboardPage.name);
      break;
    case 1:
      context.goNamed(CategoriesPage.name);
      break;
    case 2:
      context.goNamed(SettingsPage.name);
      break;
  }
}

final router = GoRouter(
  initialLocation: DashboardPage.route,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final (colorScheme, _) = getColorSchemeAndTextTheme(context);

        return Scaffold(
          backgroundColor: colorScheme.surfaceContainer,
          body: SafeArea(
            child: Row(
              children: [
                AlarmsNavigationRail(
                  selectedIndex: routeToIndex[state.fullPath] ?? 0,
                  onDestinationChanged: (idx) =>
                      destinationChangedHandler(context, idx),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      right: 16,
                      left: 4,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: DashboardPage.route,
          name: DashboardPage.name,
          builder: (context, state) => DashboardPage(),
        ),
        GoRoute(
          path: CategoriesPage.route,
          name: CategoriesPage.name,
          builder: (context, state) => CategoriesPage(),
        ),
        GoRoute(
          path: SettingsPage.route,
          name: SettingsPage.name,
          builder: (context, state) => SettingsPage(),
        ),
      ],
    ),
  ],
);

class AlarmsApp extends StatelessWidget {
  const AlarmsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alarms App',
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
