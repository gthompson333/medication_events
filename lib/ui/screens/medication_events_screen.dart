import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medication_events/business_logic/view_models/medication_events_vm.dart';
import 'add_event_screen.dart';

class MedicationEventsScreen extends StatefulWidget {
  const MedicationEventsScreen({super.key});

  @override
  MedicationEventsScreenState createState() => MedicationEventsScreenState();
}

class MedicationEventsScreenState extends State<MedicationEventsScreen> {
  // Medication view model events.
  final MedicationEventsListVM _medicationEventsList = MedicationEventsListVM();

  @override
  void initState() {
    _medicationEventsList.refreshEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medication Events"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddEventScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: _buildListView(_medicationEventsList),
    );
  }

  Widget _buildListView(MedicationEventsListVM viewModel) {
    return ChangeNotifierProvider<MedicationEventsListVM>(
      create: (context) => viewModel,
      child: Consumer<MedicationEventsListVM>(builder: (context, model, child) {
        if (model.errorMessage != null) {}
        return ListView.builder(
            itemCount: model.events.length,
            itemBuilder: (context, index) {
              return _eventListItem(model.events[index], context);
            });
      }),
    );
  }

  Widget _eventListItem(MedicationEventVM event, BuildContext context) {
    return ListTile(
      title: Text(event.name, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(event.type, style: Theme.of(context).textTheme.bodyMedium),
      trailing: Text(
        event.datetime,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
