class ChampionModel {
  final int id;
  final String name;
  final String position;
  final String role;
  final String photo;

  ChampionModel({
    required this.id,
    required this.name,
    required this.position,
    required this.role,
    required this.photo,
  });

  factory ChampionModel.fromJson(Map<String, dynamic> json) {
    return ChampionModel(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      role: json['role'],
      photo: json['photo'] ?? "https://via.placeholder.com/150",
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'position': position,
    'role': role,
    'photo': photo,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChampionModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
