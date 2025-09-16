import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/utils.dart';
import 'package:flutter/material.dart';

class CreateAlarmPage extends StatefulWidget {
  static const route = "/create-alarm-page";

  const CreateAlarmPage({super.key});

  @override
  State<CreateAlarmPage> createState() => _CreateAlarmPageState();
}

class _CreateAlarmPageState extends State<CreateAlarmPage> {
  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Crear alarma",
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
}
