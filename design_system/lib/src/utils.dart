import "package:flutter/material.dart";

(ColorScheme, TextTheme) getColorSchemeAndTextTheme(BuildContext context) {
  final ThemeData theme = Theme.of(context);

  return (theme.colorScheme, theme.textTheme);
}
