class Item {
  int id;
  String name, message;
  Item({required this.id, required this.message, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      name: json['name'] as String,
      message: json['message'] as String);
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'npm': message};
}
