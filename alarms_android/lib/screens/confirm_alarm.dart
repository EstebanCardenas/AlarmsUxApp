import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/components/button.dart';
import 'package:alarms_android/components/day_button.dart';
import 'package:alarms_android/models/days.dart';
import 'package:alarms_android/screens/alarm_list.dart';
import 'package:alarms_android/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmAlarmPage extends StatefulWidget {
  static final name = "confirm-alarm";
  static final route = "/$name";

  const ConfirmAlarmPage({super.key});

  @override
  State<ConfirmAlarmPage> createState() => _ConfirmAlarmPageState();
}

class _ConfirmAlarmPageState extends State<ConfirmAlarmPage> {
  final hourController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void initState() {
    hourController.text = "6:30 PM";
    categoryController.text = "Facturas";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Confirmar",
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AbsorbPointer(
              child: TextField(
                controller: hourController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.schedule,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  labelText: "Hora",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AbsorbPointer(
              child: TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.groups_outlined,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  labelText: "Categoría",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Días seleccionados",
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final (idx, day) in Day.values.indexed) ...[
                  AbsorbPointer(
                    child: DayButton(
                      day,
                      initialToggle: day == Day.X || day == Day.V,
                    ),
                  ),
                  if (idx != Day.values.length - 1) const SizedBox(width: 8),
                ],
              ],
            ),
            const SizedBox(height: 64),
            Button(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Alarma creada",
                      style: textTheme.headlineSmall,
                    ),
                    content: Text(
                      "Podrás verla en el listado de alarmas",
                      style: textTheme.bodyMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
                if (context.mounted) {
                  context.goNamed(AlarmListPage.name);
                }
              },
              label: "Confirmar",
              filled: true,
            ),
          ],
        ),
      ),
    );
  }
}
