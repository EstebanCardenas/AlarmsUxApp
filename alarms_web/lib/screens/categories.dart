import 'package:alarms_web/components/alarm_item.dart';
import 'package:alarms_web/components/app_bar.dart';
import 'package:alarms_web/components/category_item.dart';
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
              constraints: const BoxConstraints(),
              onPressed: () => context.goNamed(CreateCategoryPage.name),
              icon: Icon(Icons.add_circle_outline,
                  color: colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna: Las más frecuentes
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryItem( hour: 6, minute: 0, meridiemType: "AM", title: "Categoria 1"),
                        const SizedBox(height: 18),
                        CategoryItem(hour: 7, minute: 0, meridiemType: "AM", title: "Categoria 2"),
                        const SizedBox(height: 18),
                        CategoryItem(hour: 8, minute: 0, meridiemType: "AM", title: "Categoria 3"),
                        const SizedBox(height: 18),
                        CategoryItem(hour: 9, minute: 0, meridiemType: "AM", title: "Categoria 4"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Columna: Eventos familiares
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryItem(hour: 6, minute: 30, meridiemType: "AM", title: "Categoria 5"),
                        const SizedBox(height: 18),
                        CategoryItem(hour: 7, minute: 30, meridiemType: "AM", title: "Categoria 6"),
                        const SizedBox(height: 18),
                        CategoryItem(hour: 8, minute: 30, meridiemType: "AM", title: "Categoria 7"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
