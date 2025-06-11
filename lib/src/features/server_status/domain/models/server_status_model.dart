class ServerStatusModel {
  final String name;
  final String region;
  final List<dynamic> incidents;
  final List<dynamic> maintenances;

  ServerStatusModel({
    required this.name,
    required this.region,
    required this.incidents,
    required this.maintenances,
  });

  factory ServerStatusModel.fromJson(Map<String, dynamic> json, String region) {
    return ServerStatusModel(
      name: json['name'] ?? 'Unknown',
      region: region,
      incidents: json['incidents'] ?? [],
      maintenances: json['maintenances'] ?? [],
    );
  }
}
