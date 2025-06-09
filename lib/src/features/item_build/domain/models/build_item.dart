class BuildItem {
  final int id;
  final String name;
  final String photo;

  BuildItem({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory BuildItem.fromJson(Map<String, dynamic> json) {
    return BuildItem(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}
