class Task {
  String title;
  String subtitle;
  bool isCompleted;

  Task({required this.title, required this.subtitle, this.isCompleted = false});

  // Convert to Map (for SharedPreferences)
  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isCompleted': isCompleted,
  };

  // Convert from Map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isCompleted: json['isCompleted'],
      subtitle: json['subtitle'] ?? '',
    );
  }
}
