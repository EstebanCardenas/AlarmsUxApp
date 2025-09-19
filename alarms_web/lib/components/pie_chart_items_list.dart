import 'package:alarms_web/components/roboto_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PieChartItemRow extends StatelessWidget {
  final Color color;
  final String label;

  const PieChartItemRow({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 16),
          SizedBox.square(
            dimension: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(width: 16),
          RobotoText(text: label, style: textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class PieChartItem {
  final Color color;
  final String label;

  PieChartItem({required this.color, required this.label});
}

class PieChartItemsList extends StatelessWidget {
  final Iterable<PieChartItem> items;

  const PieChartItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (idx, item) in items.indexed)
          ...[
            PieChartItemRow(color: item.color, label: item.label),
            if (idx != items.length - 1)
              const SizedBox(height: 8),
          ],
      ],
    );
  }
}
