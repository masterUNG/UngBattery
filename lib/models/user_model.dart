import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String nameSur;
  final String phone;
  final String email;
  final String brand;
  final String numberModel;
  final String model;
  final String color;
  final String nicName;
  final String idQuestion;
  final String answer;
  final String password;
  UserModel({
    required this.nameSur,
    required this.phone,
    required this.email,
    required this.brand,
    required this.numberModel,
    required this.model,
    required this.color,
    required this.nicName,
    required this.idQuestion,
    required this.answer,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameSur': nameSur,
      'phone': phone,
      'email': email,
      'brand': brand,
      'numberModel': numberModel,
      'model': model,
      'color': color,
      'nicName': nicName,
      'idQuestion': idQuestion,
      'answer': answer,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nameSur: (map['nameSur'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      brand: (map['brand'] ?? '') as String,
      numberModel: (map['numberModel'] ?? '') as String,
      model: (map['model'] ?? '') as String,
      color: (map['color'] ?? '') as String,
      nicName: (map['nicName'] ?? '') as String,
      idQuestion: (map['idQuestion'] ?? '') as String,
      answer: (map['answer'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
