import 'package:design_system/src/utils.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool filled;
  final VoidCallback onTap;
  final String label;

  const Button({
    super.key,
    required this.onTap,
    required this.label,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);
    final borderRadius = BorderRadius.circular(8);

    return SizedBox(
      width: filled ? double.infinity : null,
      height: 56,
      child: Material(
        borderRadius: borderRadius,
        color: colorScheme.secondaryContainer,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          splashColor: colorScheme.onSecondaryContainer.withAlpha(26),
          highlightColor: colorScheme.onSecondaryContainer.withAlpha(20),
          child: Center(
            child: Text(
              label,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
