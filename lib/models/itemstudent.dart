class Item {
  int id;
  String name, npm;
  Item({required this.id, required this.npm, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      npm: json['npm'] as String,
      name: json['name'] as String);
  Map<String, dynamic> toJson() => {'id': id, 'npm': npm, 'name': name};
}
