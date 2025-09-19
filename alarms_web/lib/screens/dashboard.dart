import 'package:alarms_web/components/app_bar.dart';
import 'package:alarms_web/components/card.dart';
import 'package:alarms_web/components/pie_chart_items_list.dart';
import 'package:alarms_web/components/roboto_text.dart';
import 'package:alarms_web/data.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardPage extends StatelessWidget {
  static final name = "dashboard";
  static final route = "/$name";

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlarmsAppBar(title: "Dashboard"),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AlarmsCard(
                  width: 834,
                  padding: const EdgeInsets.all(24),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RobotoText(
                        text: "Alarmas por categoría",
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PieChartItemsList(
                            items: alarmsByCategory.entries.map((entry) {
                              final MapEntry(key: category, value: qty) = entry;

                              return PieChartItem(
                                color: getCategoriesToColors(
                                  colorScheme,
                                )[category]!,
                                label: "$category ($qty)",
                              );
                            }),
                          ),
                          const SizedBox(width: 300),
                          SizedBox.square(
                            dimension: 160,
                            child: PieChart(
                              dataMap: alarmsByCategory,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValues: false,
                              ),
                              legendOptions: LegendOptions(
                                showLegends: false,
                              ),
                              colorList: [...getCategoriesToColors(colorScheme).values],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 34),
                AlarmsCard(
                  width: 834,
                  padding: const EdgeInsets.all(24),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RobotoText(
                        text: "Alarmas pospuestas",
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PieChartItemsList(
                            items: postponedAlarms.entries.map((entry) {
                              final MapEntry(key: status, value: qty) = entry;

                              return PieChartItem(
                                color: getStatusToColors(
                                  colorScheme,
                                )[status]!,
                                label: "$status ($qty)",
                              );
                            }),
                          ),
                          const SizedBox(width: 300),
                          SizedBox.square(
                            dimension: 160,
                            child: PieChart(
                              dataMap: postponedAlarms,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValues: false,
                              ),
                              legendOptions: LegendOptions(
                                showLegends: false,
                              ),
                              colorList: [...getStatusToColors(colorScheme).values],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
