import 'package:alarms_android/models/alarm.dart';
import 'package:alarms_android/models/days.dart';

final alarmsByCategory = <String, List<Alarm>>{
  "Las Más Frecuentes": [
    const Alarm(
      hour: 6,
      minute: 30,
      meridiemType: MeridiemType.am,
      label: "Mañana en 7h 30 min",
      days: {Day.L, Day.M, Day.X},
      isActivated: true,
    ),
    const Alarm(
      hour: 8,
      minute: 0,
      meridiemType: MeridiemType.am,
      label: "Mañana en 8h",
      days: {Day.X},
      isActivated: true,
    ),
  ],
  "Eventos Familiares": [
    const Alarm(
      hour: 8,
      minute: 0,
      meridiemType: MeridiemType.am,
      label: "En 3 días",
      days: {Day.V, Day.S},
      isActivated: true,
    ),
    const Alarm(
      hour: 4,
      minute: 20,
      meridiemType: MeridiemType.pm,
      label: "En 4 días",
      days: {Day.S},
      isActivated: true,
    ),
    const Alarm(
      hour: 6,
      minute: 0,
      meridiemType: MeridiemType.pm,
      label: "En 5 días",
      days: {Day.D},
      isActivated: true,
    ),
  ],
  "Pagos": [
    const Alarm(
      hour: 8,
      minute: 0,
      meridiemType: MeridiemType.am,
      label: "En 3 días",
      days: {Day.V, Day.S},
      isActivated: true,
    ),
    const Alarm(
      hour: 4,
      minute: 20,
      meridiemType: MeridiemType.pm,
      label: "En 4 días",
      days: {Day.S},
      isActivated: true,
    ),
    const Alarm(
      hour: 6,
      minute: 0,
      meridiemType: MeridiemType.pm,
      label: "En 5 días",
      days: {Day.D},
      isActivated: true,
    ),
  ],
}.entries.toList();

final categories = <String>[
  "Las Más Frecuentes",
  "Eventos Familiares",
  "Pagos",
];
