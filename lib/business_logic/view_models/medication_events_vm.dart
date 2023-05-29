import 'package:flutter/foundation.dart';
import 'package:medication_events/services/propeller_network/propeller_remote_api.dart';
import 'package:medication_events/services/network_response_states.dart';

class MedicationEventsListVM extends ChangeNotifier {
  static const _eventsFetchErrorMessage =
      "Medication events list not available";
  final PropellerRemoteAPI _propellerRemoteAPI = PropellerRemoteAPI();

  // A list of medication model events suitable for presentation in the UI.
  List<MedicationEventVM> _events = [];

  // If the network produces an error, set this variable to non-null;
  String? errorMessage;

  List<MedicationEventVM> get events => _events;

  // Load events from the Propeller network API.
  void refreshEvents() async {
    errorMessage = null;
    var futureEvents = await _propellerRemoteAPI.getEvents();

    if (futureEvents is SuccessState) {
      // We have fresh events. Clear out the old ones.
      _events = [];

      // Map the network events to view model events.
      for (var event in futureEvents.value.events) {
        _events.add(MedicationEventVM(
            name: event.medication,
            type: event.medicationtype,
            dateTime: event.datetime));
      }
    } else if (futureEvents is ErrorState) {
      errorMessage = _eventsFetchErrorMessage;
    }
    // Notify consumers that new events view model data is available.
    notifyListeners();
  }

  void _addToEvents(String alphabeticCode) {
    notifyListeners();
  }
}

class MedicationEventVM {
  final String name;
  final String type;
  final String dateTime;

  MedicationEventVM(
      {required this.name, required this.type, required this.dateTime});
}
