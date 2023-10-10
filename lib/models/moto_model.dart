import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MotoModel {
  final String id;
  final String idOwner;
  final String brand;
  final String numberModel;
  final String model;
  final String color;
  final String nickname;
  final String? statusBatt;
  final String? distance;
  final String? package;
  MotoModel({
    required this.id,
    required this.idOwner,
    required this.brand,
    required this.numberModel,
    required this.model,
    required this.color,
    required this.nickname,
    this.statusBatt,
    this.distance,
    this.package,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idOwner': idOwner,
      'brand': brand,
      'numberModel': numberModel,
      'model': model,
      'color': color,
      'nickname': nickname,
      'statusBatt': statusBatt,
      'distance': distance,
      'package': package,
    };
  }

  factory MotoModel.fromMap(Map<String, dynamic> map) {
    return MotoModel(
      id: (map['id'] ?? '') as String,
      idOwner: (map['idOwner'] ?? '') as String,
      brand: (map['brand'] ?? '') as String,
      numberModel: (map['numberModel'] ?? '') as String,
      model: (map['model'] ?? '') as String,
      color: (map['color'] ?? '') as String,
      nickname: (map['nickname'] ?? '') as String,
      statusBatt: (map['statusBatt'] ?? '') as String,
      distance: (map['distance'] ?? '') as String,
      package: (map['package'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotoModel.fromJson(String source) =>
      MotoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
