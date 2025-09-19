import 'package:flutter/material.dart';

final alarmsByCategory = <String, double>{
  "Facturas": 7,
  "Frecuentes": 5,
  "Pagos": 3,
  "Deudas": 1,
};

Map<String, Color> getCategoriesToColors(ColorScheme colorScheme) => {
  "Facturas": colorScheme.onPrimaryFixed,
  "Frecuentes": colorScheme.secondary,
  "Pagos": colorScheme.tertiary,
  "Deudas": colorScheme.onErrorContainer,
};

final postponedAlarms = <String, double>{"Cumplidas": 7, "Pospuestas": 5};

Map<String, Color> getStatusToColors(ColorScheme colorScheme) => {
  "Cumplidas": colorScheme.onTertiaryFixedVariant,
  "Pospuestas": colorScheme.tertiaryFixedDim,
};
