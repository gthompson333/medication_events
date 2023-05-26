const idKey = 'id';
const datetimeKey = 'datetime';
const medicationKey = 'medication';
const medicationTypeKey = 'medicationtype';

class Event {
  late final int id;
  late final String datetime;
  late final String medication;
  late final String medicationtype;

  Event(
      {required this.id,
      required this.datetime,
      required this.medication,
      required this.medicationtype});

  Event.fromJson(Map<String, dynamic> json)
      : id = json[idKey],
        datetime = json[datetimeKey],
        medication = json[medicationKey],
        medicationtype = json[medicationTypeKey];

  Map<String, dynamic> toJson() => {
        idKey: id,
        datetimeKey: datetime,
        medicationKey: medication,
        medicationTypeKey: medicationtype
      };
}
