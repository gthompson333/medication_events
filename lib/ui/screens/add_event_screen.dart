import 'package:flutter/material.dart';
import 'package:medication_events/services/models/medication_event.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  AddEventScreenState createState() => AddEventScreenState();
}

class AddEventScreenState extends State<AddEventScreen> {
  late String _name, _timestamp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medication Event"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            nameTextField(),
            const SizedBox(
              height: 10.0,
            ),
            timestampTextField(),
            const SizedBox(
              height: 10.0,
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  TextField nameTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Medication Name",
        labelText: "Name",
      ),
      onChanged: (value) {
        _name = value;
      },
    );
  }

  TextField timestampTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Date and Time",
        labelText: "Date and Time",
      ),
      onChanged: (value) {
        _timestamp = value;
      },
    );
  }

  ElevatedButton submitButton() {
    return ElevatedButton(
      onPressed: () {
        final event = MedicationEvent(
            id: 0, datetime: _timestamp, medication: _name, medicationtype: "");
      },
      child: const Text(
        "Add",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
