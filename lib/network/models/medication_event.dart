class MedicationEvent {
  static const _idKey = 'id';
  static const _datetimeKey = 'datetime';
  static const _medicationKey = 'medication';
  static const _medicationTypeKey = 'medicationtype';

  late final int id;
  late final String datetime;
  late final String medication;
  late final String medicationtype;

  MedicationEvent(
      {required this.id,
      required this.datetime,
      required this.medication,
      required this.medicationtype});

  MedicationEvent.fromJson(Map<String, dynamic> json)
      : id = json[_idKey],
        datetime = json[_datetimeKey],
        medication = json[_medicationKey],
        medicationtype = json[_medicationTypeKey];

  Map<String, dynamic> toJson() => {
        _idKey: id,
        _datetimeKey: datetime,
        _medicationKey: medication,
        _medicationTypeKey: medicationtype
      };
}
