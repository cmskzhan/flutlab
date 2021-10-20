class User {
  int id = 0;
  String date = '';
  String username = '';
  int duration = 0;

  User(this.id, this.date, this.username, this.duration);

  User.fromJson(Map<String, dynamic> userField) {
    id = userField['id'] ?? 0;
    date = userField['date'] ?? '';
    username = userField['description']??'';
    duration = userField['duration'] ?? 0;

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': username,
      'duration': duration

    };
  }
}