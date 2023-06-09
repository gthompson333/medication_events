import 'dart:async';
import 'package:http/http.dart';
import 'propeller_remote_base.dart';
import 'package:medication_events/services/network_response_states.dart';
import 'package:medication_events/services/network_utils.dart';
import 'package:medication_events/services/propeller_api.dart';
import 'package:medication_events/services/models/medication_events_list.dart';

class PropellerRemoteAPI extends PropellerAPI {
  // Singleton
  PropellerRemoteAPI._privateConstructor();

  static final PropellerRemoteAPI _apiResponse =
      PropellerRemoteAPI._privateConstructor();

  factory PropellerRemoteAPI() => _apiResponse;
  final PropellerRemoteBase _client = PropellerRemoteBase(Client());

  @override
  Future<NetworkResult> getEvents() async {
    try {
      final response = await _client.request(
          action: RequestAction.get, path: PropellerAPI.eventsPath);
      if (response.statusCode == 200) {
        return NetworkResult<MedicationEventsList>.success(
            MedicationEventsList.fromRawJson(response.body));
      } else {
        return NetworkResult.error(PropellerAPI.getEventsErrorMessage);
      }
    } catch (error) {
      return NetworkResult.error(PropellerAPI.getEventsThrownErrorMessage);
    }
  }
}
