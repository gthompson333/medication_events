import 'package:flutter/material.dart';
import 'package:medication_events/network/models/medication_events_list.dart';
import 'package:medication_events/network/propeller/propeller_remote_api.dart';
import 'package:medication_events/network/network_response_states.dart';
import 'add_event_screen.dart';

class MedicationEventsScreen extends StatefulWidget {
  const MedicationEventsScreen({super.key});

  @override
  MedicationEventsScreenState createState() => MedicationEventsScreenState();
}

class MedicationEventsScreenState extends State<MedicationEventsScreen> {
  final PropellerRemoteAPI _propellerRemoteAPI = PropellerRemoteAPI();

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
      body: Center(
        child: FutureBuilder(
            future: _propellerRemoteAPI.getEvents(),
            builder:
                (BuildContext context, AsyncSnapshot<NetworkResult> snapshot) {
              if (snapshot.data is SuccessState) {
                MedicationEventsList medicationEvents =
                    (snapshot.data as SuccessState).value;
                return ListView.builder(
                    itemCount: medicationEvents.events.length,
                    itemBuilder: (context, index) {
                      return eventListItem(index, medicationEvents, context);
                    });
              } else if (snapshot.data is ErrorState) {
                String errorMessage = (snapshot.data as ErrorState).msg;
                return Text(errorMessage);
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Widget eventListItem(
      int index, MedicationEventsList medicationEvents, BuildContext context) {
    return ListTile(
      leading: Image.asset("images/book.png"),
      title: Text(medicationEvents.events[index].medication),
      subtitle: Text(
        medicationEvents.events[index].medicationtype,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      isThreeLine: true,
      trailing: Text(
        medicationEvents.events[index].datetime,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
