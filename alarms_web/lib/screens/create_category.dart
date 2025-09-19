import 'package:alarms_web/components/app_bar.dart';
import 'package:alarms_web/screens/categories.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCategoryPage extends StatelessWidget {
  static final name = "create-category";
  static final route = "/$name";

  const CreateCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlarmsAppBar(
            title: "Crear categoría",
            onBackBtnPress: () => context.goNamed(CategoriesPage.name),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: SizedBox(
              width: 522,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Título",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: Icon(
                          Icons.groups_outlined,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 28),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Descripción",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: Icon(
                          Icons.description_outlined,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 42),
                  Align(
                    alignment: AlignmentGeometry.bottomRight,
                    child: SizedBox(
                      width: 99,
                      child: Button(
                        onTap: () => context.goNamed(CategoriesPage.name),
                        label: "Crear",
                        labelStyle: GoogleFonts.roboto(
                          textStyle: textTheme.titleMedium,
                        ),
                      ),
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
