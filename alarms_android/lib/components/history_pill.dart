import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class HistoryPill extends StatelessWidget {
  final int times;

  const HistoryPill({
    super.key,
    required this.times,
  });


  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          "$times veces",
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
        ),
      ),
    );
  }
}
