import 'package:flutter/material.dart';
import 'ui/screens/medication_events_screen.dart';

void main() {
  runApp(const PropellerMedicationEventsApp());
}

class PropellerMedicationEventsApp extends StatelessWidget {
  const PropellerMedicationEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Propeller Health Medication Events',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MedicationEventsScreen());
  }
}
