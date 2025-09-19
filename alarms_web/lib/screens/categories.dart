import 'package:alarms_web/components/app_bar.dart';
import 'package:alarms_web/screens/create_category.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  static final name = "categories";
  static final route = "/$name";

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlarmsAppBar(
            title: "Categorías",
            action: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () => context.goNamed(CreateCategoryPage.name),
              icon: Icon(Icons.add_circle_outline, color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}
