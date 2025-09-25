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
                              builder: (_) => AlertDialog(
                                title: const Text("Confirmar acción"),
                                content: const Text(
                                  "Esta acción no se puede deshacer. ¿Desea continuar?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => {
                                      // Navigator.pop(context)
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Acción de confirmación
                                      //Navigator.pop(context);
                                    },
                                    child: const Text("Sí, continuar"),
                                  ),
                                ],
                              ),
                            )
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
