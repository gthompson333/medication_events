import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
//import 'package:medication_events/services/propeller_network/propeller_remote_api.dart';
import 'package:medication_events/services/propeller_mock/propeller_mock_api.dart';
import 'package:medication_events/services/network_response_states.dart';

class MedicationEventsListVM extends ChangeNotifier {
  static const _eventsFetchErrorMessage =
      "Medication events list not available";

  //final PropellerRemoteAPI _propellerAPI = PropellerRemoteAPI();
  final PropellerMockAPI _propellerAPI = PropellerMockAPI();

  // A list of medication view model events suitable for presentation in the UI.
  List<MedicationEventVM> _events = [];

  /// Network error message. Non-null if an error is present.
  String? errorMessage;

  /// View model medication events.
  List<MedicationEventVM> get events => _events;

  /// Fetch a fresh set of events from the Propeller API.
  void refreshEvents() async {
    errorMessage = null;
    var futureEvents = await _propellerAPI.getEvents();

    if (futureEvents is SuccessState) {
      // We have fresh events. Clear out the old ones.
      _events = [];

      // Map the network events to view model events.
      for (var event in futureEvents.value.events) {
        _events.add(MedicationEventVM(
            name: event.medication,
            type: event.medicationtype,
            datetime: event.datetime));
      }
    } else if (futureEvents is ErrorState) {
      errorMessage = _eventsFetchErrorMessage;
    }

    // Sort the view model events by datetime.
    _events.sort((a, b) => b.datetimeObj.compareTo(a.datetimeObj));

    // Notify consumers that new view model events are available.
    notifyListeners();
  }

  void addToEvents(MedicationEventVM event) {
    _events.add(event);
    _events.sort((a, b) => b.datetimeObj.compareTo(a.datetimeObj));
    notifyListeners();
  }
}

class MedicationEventVM {
  final String name;
  final String type;
  late String datetime;
  late final DateTime datetimeObj;

  MedicationEventVM(
      {required this.name, required this.type, required this.datetime}) {
    datetimeObj = DateTime.parse(datetime);
    datetime = DateFormat('MMMM dd yyyy hh:mm aaa').format(datetimeObj);
  }
}
