class ChampionModel {
  final int id;
  final String name;
  final String position;
  final String role;

  ChampionModel({
    required this.id,
    required this.name,
    required this.position,
    required this.role,
  });

  factory ChampionModel.fromJson(Map<String, dynamic> json) {
    return ChampionModel(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'position': position,
    'role': role,
  };
}
