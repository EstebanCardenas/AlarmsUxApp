import 'package:alarms_web/components/nav_rail.dart';
import 'package:alarms_web/screens/alarms.dart';
import 'package:alarms_web/screens/categories.dart';
import 'package:alarms_web/screens/create_category.dart';
import 'package:alarms_web/screens/dashboard.dart';
import 'package:alarms_web/screens/reports.dart';
import 'package:alarms_web/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:design_system/design_system.dart';

void main() {
  runApp(const AlarmsApp());
}

int getSelectedIndexFromPath(String path) {
  if (path.startsWith(DashboardPage.route)) {
    return 0;
  } 
  
  if (path.startsWith(AlarmsPage.route)) {
    return 1;
  } 
  
  if (path.startsWith(ReportsPage.route)) {
    return 2;
  }

  if (path.startsWith(CategoriesPage.route)) {
    return 3;
  }

  if (path.startsWith(SettingsPage.route)) {
    return 4;
  }

  return 0;
}

void destinationChangedHandler(BuildContext context, int idx) {
  switch (idx) {
    case 0:
      context.goNamed(DashboardPage.name);
      break;
    case 1:
      context.goNamed(AlarmsPage.name);
      break;
    case 2:
      context.goNamed(ReportsPage.name);
      break;
    case 3:
      context.goNamed(CategoriesPage.name);
      break;
    case 4:
      context.goNamed(SettingsPage.name);
      break;
  }
}

CustomTransitionPage getFadeTransitionPage({
  required Widget child,
  required LocalKey key,
}) => CustomTransitionPage(
  key: key,
  child: child,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.easeOutSine).animate(animation),
      child: child,
    );
  },
);

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
                  selectedIndex: getSelectedIndexFromPath(state.fullPath ?? ''),
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
          pageBuilder: (context, state) =>
              getFadeTransitionPage(child: DashboardPage(), key: state.pageKey),
        ),
        GoRoute(
          path: CategoriesPage.route,
          name: CategoriesPage.name,
          pageBuilder: (context, state) => getFadeTransitionPage(
            child: CategoriesPage(),
            key: state.pageKey,
          ),
          routes: [
            GoRoute(
              path: CreateCategoryPage.route,
              name: CreateCategoryPage.name,
              pageBuilder: (context, state) => getFadeTransitionPage(
                child: CreateCategoryPage(),
                key: state.pageKey,
              ),
            ),
          ],
        ),
        GoRoute(
          path: AlarmsPage.route,
          name: AlarmsPage.name,
          pageBuilder: (context, state) =>
              getFadeTransitionPage(child: AlarmsPage(), key: state.pageKey),
        ),
        GoRoute(
          path: ReportsPage.route,
          name: ReportsPage.name,
          pageBuilder: (context, state) =>
              getFadeTransitionPage(child: ReportsPage(), key: state.pageKey),
        ),
        GoRoute(
          path: SettingsPage.route,
          name: SettingsPage.name,
          pageBuilder: (context, state) =>
              getFadeTransitionPage(child: SettingsPage(), key: state.pageKey),
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
