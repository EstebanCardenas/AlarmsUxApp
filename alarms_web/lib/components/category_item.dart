import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class CategoryItem extends StatelessWidget {
  final int hour;
  final int minute;
  final String meridiemType;
  final String title;

  const CategoryItem({
    super.key,
    required this.hour,
    required this.minute,
    required this.meridiemType,
    required this.title,
  });

  String get formattedHour {
    String minuteStr = minute < 10 ? '0$minute' : '$minute';

    return "$hour:$minuteStr $meridiemType";
  }

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(height: 36),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet",
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
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
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
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
          ],
        ),
      ],
    );
  }
}
