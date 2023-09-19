import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  final String id;
  final String question;
  QuestionModel({
    required this.id,
    required this.question,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: (map['id'] ?? '') as String,
      question: (map['question'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
