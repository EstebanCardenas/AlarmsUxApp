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
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Description duis aute irure dolor in reprehenderit in voluptate velit.",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (dialogCtx) => AlertDialog(
                            title: const Text("Eliminar categoría"),
                            content: const Text(
                              "Desea eliminar 'categoría x'?",
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
                                  foregroundColor: colorScheme.primary, // color del texto/ícono
                                ),
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
          ],
        ),
      ],
    );
  }
}
