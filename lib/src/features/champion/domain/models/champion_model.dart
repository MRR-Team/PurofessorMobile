class ChampionModel {
  final int id;
  final String name;
  final String position;

  ChampionModel({required this.id, required this.name, required this.position});

  factory ChampionModel.fromJson(Map<String, dynamic> json) {
    return ChampionModel(
      id: json['id'],
      name: json['name'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'position': position,
  };
}
