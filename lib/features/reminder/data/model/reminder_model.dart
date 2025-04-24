class ReminderModel {
  final int id;
  final String title;
  final String description;
  final DateTime dateTime;
  final bool isCompleted;
  const ReminderModel({
    required this.isCompleted,
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      isCompleted: json['isCompleted'] as bool,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}
