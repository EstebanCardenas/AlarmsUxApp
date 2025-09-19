import 'package:alarms_android/components/alarms_app_bar.dart';
import 'package:alarms_android/components/day_button.dart';
import 'package:alarms_android/data.dart';
import 'package:alarms_android/models/days.dart';
import 'package:alarms_android/screens/confirm_alarm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:design_system/design_system.dart';

class CreateAlarmPage extends StatefulWidget {
  static const name = "create-alarm";
  static const route = "/$name";

  const CreateAlarmPage({super.key});

  @override
  State<CreateAlarmPage> createState() => _CreateAlarmPageState();
}

class _CreateAlarmPageState extends State<CreateAlarmPage> {
  final hourController = TextEditingController();

  late final List<DropdownMenuEntry<String>> entries;

  @override
  void initState() {
    super.initState();
    entries = categories
        .map((category) => DropdownMenuEntry(value: category, label: category))
        .toList();
  }

  @override
  void dispose() {
    hourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      appBar: AlarmsAppBar(
        title: "Crear alarma",
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialEntryMode: TimePickerEntryMode.input,
                  cancelText: "Cancelar",
                  helpText: "Seleccionar hora",
                  hourLabelText: "Hora",
                  minuteLabelText: "Minuto",
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  String minuteStr = time.minute < 10
                      ? "0${time.minute}"
                      : "${time.minute}";
                  String hourStr = time.hour > 12
                      ? "${time.hour - 12}"
                      : "${time.hour}";
                  if (time.hour == 0) hourStr = '12';
                  hourController.text =
                      "$hourStr:$minuteStr ${time.period.name.toUpperCase()}";
                }
              },
              child: AbsorbPointer(
                absorbing: true,
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
            ),
            const SizedBox(height: 24),
            DropdownMenu<String>(
              dropdownMenuEntries: entries,
              expandedInsets: EdgeInsets.zero,
              leadingIcon: Icon(
                Icons.groups_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
              hintText: "Seleccionar",
            ),
            const SizedBox(height: 16),
            Text(
              "Seleccionar días",
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
                  DayButton(day),
                  if (idx != Day.values.length - 1) const SizedBox(width: 8),
                ],
              ],
            ),
            const SizedBox(height: 64),
            Button(
              onTap: () {
                context.goNamed(ConfirmAlarmPage.name);
              },
              label: "Crear",
              filled: true,
            ),
          ],
        ),
      ),
    );
  }
}
