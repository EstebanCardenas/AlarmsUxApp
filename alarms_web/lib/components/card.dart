import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AlarmsCard extends StatelessWidget {
  final Widget content;
  final double? width;
  final double? height;

  const AlarmsCard({super.key, required this.content, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: colorScheme.onPrimaryContainer),
        ),
        child: content,
      ),
    );
  }
}
