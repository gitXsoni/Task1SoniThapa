class DataModel {
  final String createdAt;
  final String name;
  final int? lesson;
  final int? duration;
  final String category;
  final bool? locked;
  final String id;

  DataModel({
    required this.createdAt,
    required this.name,
    this.lesson,
    this.duration,
    required this.category,
    this.locked,
    required this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      createdAt: json['createdAt'] ?? '',
      name: json['name'] ?? '',
      lesson: json['lesson'] as int?,
      duration: json['duration'] as int?,
      category: json['category'] ?? '',
      locked: json['locked'] as bool?,
      id: json['id'] ?? '',
    );
  }
}
