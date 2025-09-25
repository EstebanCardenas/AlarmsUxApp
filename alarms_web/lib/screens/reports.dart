import 'package:alarms_web/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class ReportsPage extends StatelessWidget {
  static final name = "reports";
  static final route = "/$name";

  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    // Datos de ejemplo (cámbialos por tu fuente real)
    final categorias = <String, List<_Stat>>{
      'Las más frecuentes': const [
        _Stat('Creadas', 3),
        _Stat('Postpuestas', 2),
        _Stat('Cumplidas', 3),
      ],
      'Categoría 1': const [
        _Stat('Creadas', 3),
        _Stat('Postpuestas', 2),
        _Stat('Cumplidas', 3),
      ],
      'Categoría 2': const [
        _Stat('Creadas', 3),
        _Stat('Postpuestas', 2),
        _Stat('Cumplidas', 3),
      ],
      'Categoría 3': const [
        _Stat('Creadas', 3),
        _Stat('Postpuestas', 2),
        _Stat('Cumplidas', 3),
      ],
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final izquierda = _LeftReportColumn(
            categorias: categorias,
            colorScheme: colorScheme,
            textTheme: textTheme,
          );

          final derecha = _RightCardsColumn(
            colorScheme: colorScheme,
            textTheme: textTheme,
            cards: const [
              _MetricCardData(count: 13, title: 'Activas', subtitle: 'Cantidad de alarmas creadas'),
              _MetricCardData(count: 13, title: 'Postpuestas', subtitle: 'Cantidad de alarmas postpuestas'),
              _MetricCardData(count: 13, title: 'Completas', subtitle: 'Cantidad de alarmas completadas'),
            ],
          );

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AlarmsAppBar(title: "Reportes"),
                const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: izquierda),
                      const SizedBox(width: 48),
                      SizedBox(width: 420, child: derecha),
                    ],
                  ),
                  ),
                  
              ],
            );
        },
      ),
    );
  }
}

/// --------- Columna izquierda (categorías + pastillas) ---------

class _LeftReportColumn extends StatelessWidget {
  final Map<String, List<_Stat>> categorias;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _LeftReportColumn({
    required this.categorias,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categorias.entries
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _CategoryRow(
                  title: e.key,
                  stats: e.value,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ))
          .toList(),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final String title;
  final List<_Stat> stats;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _CategoryRow({
    required this.title,
    required this.stats,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Título de la fila
        SizedBox(
          width: 220,
          child: Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
        // Pastillas de conteo
        Wrap(
          spacing: 28,
          runSpacing: 16,
          children: stats
              .map((s) => _StatPill(
                    label: s.label,
                    count: s.count,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  final int count;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _StatPill({
    required this.label,
    required this.count,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circulito con número
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: colorScheme.error,
            shape: BoxShape.circle,
            boxShadow: kElevationToShadow[1],
          ),
          alignment: Alignment.center,
          child: Text(
            '$count',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onError,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Stat {
  final String label;
  final int count;
  const _Stat(this.label, this.count);
}

/// --------- Columna derecha (tarjetas métricas) ---------

class _RightCardsColumn extends StatelessWidget {
  final List<_MetricCardData> cards;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _RightCardsColumn({
    required this.cards,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cards
          .map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _MetricCard(
                  data: c,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ))
          .toList(),
    );
  }
}

class _MetricCardData {
  final int count;
  final String title;
  final String subtitle;
  const _MetricCardData({
    required this.count,
    required this.title,
    required this.subtitle,
  });
}

class _MetricCard extends StatelessWidget {
  final _MetricCardData data;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _MetricCard({
    required this.data,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Bolita con número
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${data.count}',
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Título + subtítulo
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
