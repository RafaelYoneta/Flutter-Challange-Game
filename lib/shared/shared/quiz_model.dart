import 'dart:convert';

import 'package:organics/shared/shared/quiz_answer.dart';

class QuestionModel {

  final String title;
  final List<AnswerModel> answer;

  QuestionModel({
    required this.title,
    required this.answer,
  })
    : assert(
        answer.length == 4
      );
      // A quantidade de resposntas possíveis deve ser 4, por isso a função assert


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answer': answer.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answer: List<AnswerModel>.from(map['answer']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}
