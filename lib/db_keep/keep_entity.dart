import 'package:intl/intl.dart';

class KeepEntity {
  int id;
  DateTime createdTime;
  int type;
  int kcal;
  String event;

  KeepEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.kcal,
    required this.event,
  });

  factory KeepEntity.fromJson(Map<String, dynamic> json) {
    return KeepEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      kcal: json['kcal'],
      event: json['event'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'kcal': kcal,
      'event': event,
    };
  }

  String get createdTimeStr =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(createdTime);
}
