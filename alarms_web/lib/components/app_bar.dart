import 'package:alarms_web/components/roboto_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AlarmsAppBar extends StatelessWidget {
  final VoidCallback? onBackBtnPress;
  final String title;
  final Widget? action;

  const AlarmsAppBar({
    super.key,
    this.onBackBtnPress,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        children: [
          if (onBackBtnPress != null)
            IconButton(
              onPressed: onBackBtnPress,
              icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
            ),
          RobotoText(
            text: title,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          if (action != null) action!,
        ],
      ),
    );
  }
}
