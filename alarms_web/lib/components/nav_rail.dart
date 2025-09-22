import 'package:alarms_web/components/roboto_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AlarmsNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onDestinationChanged;

  const AlarmsNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationChanged,
  });

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    TextStyle? getTextStyle(bool isSelected) {
      return textTheme.labelMedium?.copyWith(
        color: isSelected
            ? colorScheme.secondary
            : colorScheme.onSurfaceVariant,
      );
    }

    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      groupAlignment: -1,
      backgroundColor: colorScheme.surfaceContainer,
      leading: Padding(
        padding: const EdgeInsets.only(top: 48, bottom: 36),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          constraints: BoxConstraints(),
        ),
      ),
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.pie_chart_outline),
          label: RobotoText(text: "Dashboard", style: getTextStyle(selectedIndex == 0)),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.alarm_outlined),
          label: RobotoText(text: "Alarmas", style: getTextStyle(selectedIndex == 1)),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.tab_outlined),
          label: RobotoText(text: "Reportes", style: getTextStyle(selectedIndex == 2)),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.groups_outlined),
          label: RobotoText(text: "Categorías", style: getTextStyle(selectedIndex == 3)),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          label: RobotoText(text: "Ajustes", style: getTextStyle(selectedIndex == 4)),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationChanged,
    );
  }
}
