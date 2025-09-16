import 'package:alarms_android/models/days.dart';

enum MeridiemType { am, pm }

class Alarm {
  final int hour;
  final int minute;
  final MeridiemType meridiemType;
  final String label;
  final Set<Day> days;
  final bool isActivated;

  const Alarm({
    required this.hour,
    required this.minute,
    required this.meridiemType,
    required this.label,
    required this.days,
    required this.isActivated,
  });
}
