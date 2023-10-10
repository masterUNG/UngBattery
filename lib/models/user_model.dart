import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String? id;
  final String nameSur;
  final String phone;
  final String email;

  final String idQuestion;
  final String answer;
  final String password;
  UserModel({
    this.id,
    required this.nameSur,
    required this.phone,
    required this.email,
    required this.idQuestion,
    required this.answer,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameSur': nameSur,
      'phone': phone,
      'email': email,
      'idQuestion': idQuestion,
      'answer': answer,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? '') as String,
      nameSur: (map['nameSur'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      idQuestion: (map['idQuestion'] ?? '') as String,
      answer: (map['answer'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
