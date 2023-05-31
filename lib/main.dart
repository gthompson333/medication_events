import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'ui/screens/medication_events_screen.dart';
import 'ui/propeller_theme.dart';

void main() {
  initializeDateFormatting();
  runApp(const PropellerMedicationEventsApp());
}

class PropellerMedicationEventsApp extends StatelessWidget {
  const PropellerMedicationEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Propeller Health Medication Events',
        theme: PropellerTheme.light(),
        darkTheme: PropellerTheme.dark(),
        themeMode: ThemeMode.system,
        home: const MedicationEventsScreen());
  }
}
