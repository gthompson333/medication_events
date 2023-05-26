import 'dart:convert';
import 'medication_event.dart';

class MedicationEventsList {
  static const _eventsKey = "events";

  final List<MedicationEvent> events;
  MedicationEventsList({required this.events});

  factory MedicationEventsList.fromRawJson(String str) =>
      MedicationEventsList.fromJson(json.decode(str));

  factory MedicationEventsList.fromJson(Map<String, dynamic> json) =>
      MedicationEventsList(
          events: List<MedicationEvent>.from(
              json[_eventsKey].map((x) => MedicationEvent.fromJson(x))));

  Map<String, dynamic> toJson() => {
        _eventsKey: List<dynamic>.from(events.map((x) => x.toJson())),
      };
}
