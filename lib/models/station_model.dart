import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StationModel {
  final String id;
  final String name;
  final String lat;
  final String lng;
  final double? distance;
  StationModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    this.distance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
      'distance': distance,
    };
  }

  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      lat: (map['lat'] ?? '') as String,
      lng: (map['lng'] ?? '') as String,
      distance: (map['distance'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory StationModel.fromJson(String source) =>
      StationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
