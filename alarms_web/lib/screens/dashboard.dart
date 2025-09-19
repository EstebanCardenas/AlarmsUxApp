import 'package:alarms_web/components/roboto_text.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static final name = "dashboard";
  static final route = "/dashboard";

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: RobotoText(text: "Dashboard page")),
    );
  }
}
