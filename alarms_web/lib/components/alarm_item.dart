import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class AlarmItem extends StatelessWidget {
  final int hour;
  final int minute;
  final String meridiemType;

  const AlarmItem({
    super.key,
    required this.hour,
    required this.minute,
    required this.meridiemType,
  });

  String get formattedHour {
    String minuteStr = minute < 10 ? '0$minute' : '$minute';

    return "$hour:$minuteStr$meridiemType";
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 111,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(19, 29, 18, 29),
                  child: Text(
                    formattedHour,
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alarma 1",
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Description duis aute irure dolor in reprehenderit in",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (dialogCtx) => AlertDialog(
                                title: const Text("Eliminar alarma"),
                                content: const Text(
                                  "Desea eliminar 'alarma 2'?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => {
                                      Navigator.of(dialogCtx).pop(false)
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  TextButton.icon(
                                    onPressed: () => {
                                      Navigator.of(dialogCtx).pop(false)
                                    },
                                    icon: const Icon(Icons.delete, size: 20),
                                    label: const Text("Eliminar"),
                                    style: TextButton.styleFrom(
                                      foregroundColor: colorScheme
                                          .primary, // color del texto/ícono
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          },
                          child: Icon(
                            Icons.delete,
                            size: 24,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Eliminar",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "• 23 min",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
