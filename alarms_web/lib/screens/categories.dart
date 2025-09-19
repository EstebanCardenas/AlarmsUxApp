import 'package:alarms_web/components/roboto_text.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  static final name = "categories";
  static final route = "/categories";

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: RobotoText(text: "Categories page")),
    );
  }
}
