import 'dart:async';
import 'package:flutter/services.dart';
import 'package:medication_events/services/network_response_states.dart';
import 'package:medication_events/services/propeller_api.dart';
import 'package:medication_events/services/models/medication_events_list.dart';

class PropellerMockAPI extends PropellerAPI {
  // Singleton
  PropellerMockAPI._privateConstructor();

  static final PropellerMockAPI _apiResponse =
      PropellerMockAPI._privateConstructor();

  factory PropellerMockAPI() => _apiResponse;

  @override
  Future<NetworkResult> getEvents() async {
    final String response =
        await rootBundle.loadString('mock_data/${PropellerAPI.eventsPath}');
    if (PropellerAPI.successStatusCode == 200) {
      return NetworkResult<MedicationEventsList>.success(
          MedicationEventsList.fromRawJson(response));
    } else {
      return NetworkResult.error(PropellerAPI.getEventsErrorMessage);
    }
  }
}
