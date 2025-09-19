import 'package:alarms_web/components/app_bar.dart';
import 'package:alarms_web/components/card.dart';
import 'package:alarms_web/components/roboto_text.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  static final name = "settings";
  static final route = "/$name";

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var slackIntegration = false;

  @override
  Widget build(BuildContext context) {
    final (colorScheme, textTheme) = getColorSchemeAndTextTheme(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AlarmsAppBar(title: "Ajustes"),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AlarmsCard(
                  width: 456,
                  content: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RobotoText(
                          text: "Integraciones",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RobotoText(text: "Slack", style: textTheme.bodyMedium),
                              Switch(
                                value: slackIntegration,
                                onChanged: (_) => setState(
                                  () => slackIntegration = !slackIntegration,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AlarmsCard(
                  width: 456,
                  content: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RobotoText(
                          text: "Gestión de datos",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            RobotoText(
                              text: "Importar alarmas",
                              style: textTheme.bodyMedium,
                            ),
                            Spacer(),
                            SizedBox(
                              width: 127,
                              height: 40,
                              child: Button(
                                onTap: () {},
                                label: "Subir archivo",
                                labelStyle: GoogleFonts.roboto(
                                  textStyle: textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            RobotoText(
                              text: "Exportar alarmas",
                              style: textTheme.bodyMedium,
                            ),
                            Spacer(),
                            SizedBox(
                              width: 127,
                              height: 40,
                              child: Button(
                                onTap: () {},
                                label: "Descargar",
                                labelStyle: GoogleFonts.roboto(
                                  textStyle: textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
