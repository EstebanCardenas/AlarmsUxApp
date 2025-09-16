import 'package:flutter/material.dart';
import 'colors.dart';

// Assuming your AppColors class is defined in a separate file.
// import 'path_to_your_app_colors/app_colors.dart';

ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.materialThemeSysLightPrimary,
  onPrimary: AppColors.materialThemeSysLightOnPrimary,
  primaryContainer: AppColors.materialThemeSysLightPrimaryContainer,
  onPrimaryContainer: AppColors.materialThemeSysLightOnPrimaryContainer,
  secondary: AppColors.materialThemeSysLightSecondary,
  onSecondary: AppColors.materialThemeSysLightOnSecondary,
  secondaryContainer: AppColors.materialThemeSysLightSecondaryContainer,
  onSecondaryContainer: AppColors.materialThemeSysLightOnSecondaryContainer,
  tertiary: AppColors.materialThemeSysLightTertiary,
  onTertiary: AppColors.materialThemeSysLightOnTertiary,
  tertiaryContainer: AppColors.materialThemeSysLightTertiaryContainer,
  onTertiaryContainer: AppColors.materialThemeSysLightOnTertiaryContainer,
  error: AppColors.materialThemeSysLightError,
  onError: AppColors.materialThemeSysLightOnError,
  errorContainer: AppColors.materialThemeSysLightErrorContainer,
  onErrorContainer: AppColors.materialThemeSysLightOnErrorContainer,
  surface: AppColors.materialThemeSysLightSurface,
  onSurface: AppColors.materialThemeSysLightOnSurface,
  surfaceContainerHighest:
      AppColors.materialThemeSysLightSurfaceContainerHighest,
  surfaceContainerHigh: AppColors.materialThemeSysLightSurfaceContainerHigh,
  surfaceContainer: AppColors.materialThemeSysLightSurfaceContainer,
  surfaceContainerLow: AppColors.materialThemeSysLightSurfaceContainerLow,
  surfaceContainerLowest: AppColors.materialThemeSysLightSurfaceContainerLowest,
  onSurfaceVariant: AppColors.materialThemeSysLightOnSurfaceVariant,
  outline: AppColors.materialThemeSysLightOutline,
  outlineVariant: AppColors.materialThemeSysLightOutlineVariant,
  shadow: AppColors.materialThemeSysLightShadow,
  scrim: AppColors.materialThemeSysLightScrim,
  inverseSurface: AppColors.materialThemeSysLightInverseSurface,
  onInverseSurface: AppColors.materialThemeSysLightInverseOnSurface,
  inversePrimary: AppColors.materialThemeSysLightInversePrimary,
);

ThemeData lightTheme = ThemeData(colorScheme: lightColorScheme);
