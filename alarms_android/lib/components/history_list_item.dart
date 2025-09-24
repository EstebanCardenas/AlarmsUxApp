import 'package:alarms_android/components/history_pill.dart';
import 'package:alarms_android/components/hour_pill.dart';
import 'package:alarms_android/models/alarm.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class HistoryListItem extends StatefulWidget {
  final Alarm alarm;

  const HistoryListItem(this.alarm, {super.key});

  @override
  State<HistoryListItem> createState() => _HistoryListItemState();
}

class _HistoryListItemState extends State<HistoryListItem> {
  @override
  void initState() {
    super.initState();
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
            const SizedBox(width: 48),
            HistoryPill(times: widget.alarm.timesSnoozed),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reprogramada", 
                    style: textTheme.labelMedium?.copyWith(color: colorScheme.onSurface)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
