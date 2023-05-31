import 'package:medication_events/services/network_response_states.dart';

abstract class PropellerAPI {
  static const eventsPath = "propeller_mobile_assessment_data.json";
  static const getEventsErrorMessage =
      "Get medication events network error.";
  static const getEventsThrownErrorMessage =
      "Get medication events error thrown.";
  static const successStatusCode = 200;

  Future<NetworkResult> getEvents();
}
