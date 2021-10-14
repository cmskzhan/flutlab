class Users {
  int id = 0;
  String name = '';
  String location = '';
  int age = 0;

  //Users(this.id, this.name, this.age, this.location);
  Users();

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    age = json['age'] ?? 0;
    location = json['location'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'location': location,
    };
  }
}