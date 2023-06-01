import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:medication_events/business_logic/view_models/medication_events_vm.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key, required this.onCreate});

  final Function(MedicationEventVM) onCreate;
  final DateFormat prettyDateFormat = DateFormat('MMMM dd yyyy');
  final DateFormat utcDateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.mmmZ');

  @override
  AddEventScreenState createState() => AddEventScreenState();
}

class AddEventScreenState extends State<AddEventScreen> {
  String _name = '';
  DateTime _eventDate = DateTime.now();
  TimeOfDay _eventTime = TimeOfDay.now();

  void _showCupertinoDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final initialDate = DateTime.now();

    if (Platform.isIOS) {
      _showCupertinoDialog(CupertinoDatePicker(
        initialDateTime: initialDate,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        showDayOfWeek: true,
        onDateTimeChanged: (DateTime pickedDate) {
          setState(() => _eventDate = pickedDate);
        },
      ));
    } else {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1980),
        lastDate: DateTime.now(),
      );

      if (pickedDate != null) {
        setState(() => _eventDate = pickedDate);
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    if (Platform.isIOS) {
      _showCupertinoDialog(CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (DateTime pickedTime) {
          setState(() => _eventTime =
              TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute));
        },
      ));
    } else {
      final TimeOfDay? pickedTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (pickedTime != null) {
        setState(() {
          _eventTime = pickedTime;
        });
      }
    }
  }

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
            datePicker(),
            const SizedBox(
              height: 10.0,
            ),
            timePicker(),
            const SizedBox(
              height: 10.0,
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Medication Name",
      ),
      onChanged: (value) {
        _name = value;
      },
    );
  }

  Widget datePicker() {
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      child: Text(widget.prettyDateFormat.format(_eventDate)),
    );
  }

  Widget timePicker() {
    return ElevatedButton(
      onPressed: () => _selectTime(context),
      child: Text(_eventTime.format(context)),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        DateTime combinedDateTime = _eventDate.copyWith(
            hour: _eventTime.hour, minute: _eventTime.minute);
        widget.onCreate(MedicationEventVM(
            name: _name,
            type: '',
            datetime: widget.utcDateFormat.format(combinedDateTime)));
        Navigator.of(context).pop();
      },
      child: const Text(
        "Add Event",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
