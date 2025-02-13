// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FaqModel {
  final String id;
  final String question;
  final String answer;
  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  FaqModel copyWith({
    String? id,
    String? question,
    String? answer,
  }) {
    return FaqModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      id: map['_id'] as String,
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FaqModel(id: $id, question: $question, answer: $answer)';

  @override
  bool operator ==(covariant FaqModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ answer.hashCode;
}
