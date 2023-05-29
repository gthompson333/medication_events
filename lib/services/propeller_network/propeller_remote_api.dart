import 'dart:async';
import 'package:http/http.dart';
import 'propeller_remote_base.dart';
import 'package:medication_events/services/network_response_states.dart';
import 'package:medication_events/services/network_utils.dart';
import 'package:medication_events/services/models/medication_events_list.dart';

class PropellerRemoteAPI {
  static const _eventsPath = "propeller_mobile_assessment_data.json";
  static const _getEventsNetworkErrorMessage =
      "Get medication events network error.";
  static const _getEventsThrownErrorMessage =
      "Get medication events error thrown.";

  // Singleton
  PropellerRemoteAPI._privateConstructor();

  static final PropellerRemoteAPI _apiResponse =
      PropellerRemoteAPI._privateConstructor();

  factory PropellerRemoteAPI() => _apiResponse;
  PropellerRemoteBase _client = PropellerRemoteBase(Client());

  Future<NetworkResult> getEvents() async {
    try {
      final response =
          await _client.request(action: RequestAction.get, path: _eventsPath);
      if (response.statusCode == 200) {
        return NetworkResult<MedicationEventsList>.success(
            MedicationEventsList.fromRawJson(response.body));
      } else {
        return NetworkResult.error(_getEventsNetworkErrorMessage);
      }
    } catch (error) {
      return NetworkResult.error(_getEventsThrownErrorMessage);
    }
  }
}
