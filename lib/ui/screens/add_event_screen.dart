import 'package:flutter/material.dart';
import 'package:medication_events/business_logic/view_models/medication_events_vm.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key, required this.onCreate});

  final Function(MedicationEventVM) onCreate;

  @override
  AddEventScreenState createState() => AddEventScreenState();
}

class AddEventScreenState extends State<AddEventScreen> {
  String _name = '';
  String _datetime = '';

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
        _datetime = value;
      },
    );
  }

  ElevatedButton submitButton() {
    return ElevatedButton(
      onPressed: () {
        widget.onCreate(
            MedicationEventVM(name: _name, type: '', datetime: _datetime));
        Navigator.of(context).pop();
      },
      child: const Text(
        "Add",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
