import 'package:alarms_android/components/day_badge.dart';
import 'package:alarms_android/components/hour_pill.dart';
import 'package:alarms_android/models/alarm.dart';
import 'package:alarms_android/models/days.dart';
import 'package:alarms_android/utils.dart';
import 'package:flutter/material.dart';

class AlarmListItem extends StatefulWidget {
  final Alarm alarm;

  const AlarmListItem(this.alarm, {super.key});

  @override
  State<AlarmListItem> createState() => _AlarmListItemState();
}

class _AlarmListItemState extends State<AlarmListItem> {
  var switchToggled = false;

  @override
  void initState() {
    super.initState();
    switchToggled = widget.alarm.isActivated;
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            HourPill(
              hour: widget.alarm.hour,
              minute: widget.alarm.minute,
              meridiemType: widget.alarm.meridiemType,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.alarm.label, style: textTheme.bodyLarge),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final (idx, day) in Day.values.indexed) ...[
                        DayBadge(
                          day: day,
                          toggled: widget.alarm.days.contains(day),
                        ),
                        if (idx < Day.values.length - 1)
                          const SizedBox(width: 4),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Switch(
              value: switchToggled,
              onChanged: (value) => setState(() => switchToggled = value),
            ),
          ],
        ),
      ),
    );
  }
}
