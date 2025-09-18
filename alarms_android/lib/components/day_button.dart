import 'package:alarms_android/models/days.dart';
import 'package:alarms_android/utils.dart';
import 'package:flutter/material.dart';

class DayButton extends StatefulWidget {
  final Day day;
  final bool initialToggle;

  const DayButton(this.day, {super.key, this.initialToggle = false});

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  var toggled = false;

  @override
  void initState() {
    toggled = widget.initialToggle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return SizedBox.square(
      dimension: 32,
      child: Material(
        type: MaterialType.circle,
        color: toggled ? colorScheme.primary : colorScheme.surfaceContainerHigh,
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () => setState(() => toggled = !toggled),
          child: Center(
            child: Text(
              widget.day.name,
              style: textTheme.labelLarge?.copyWith(
                color: toggled
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
