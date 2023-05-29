import 'dart:async';
import 'package:flutter/services.dart';
import 'package:medication_events/services/network_response_states.dart';
import 'package:medication_events/services/models/medication_events_list.dart';

class PropellerMockAPI {
  static const _eventsPath = "propeller_mobile_assessment_data.json";
  static const _getEventsMockErrorMessage =
      "Get medication events network error.";
  static const _mockStatusCode = 200;

  // Singleton
  PropellerMockAPI._privateConstructor();

  static final PropellerMockAPI _apiResponse =
      PropellerMockAPI._privateConstructor();

  factory PropellerMockAPI() => _apiResponse;

  Future<NetworkResult> getEvents() async {
    final String response = await rootBundle
        .loadString('mock_data/$_eventsPath');
    if (_mockStatusCode == 200) {
      return NetworkResult<MedicationEventsList>.success(
          MedicationEventsList.fromRawJson(response));
    } else {
      return NetworkResult.error(_getEventsMockErrorMessage);
    }
  }
}
