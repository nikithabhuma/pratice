// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  FaQs? faQs;
  String? id;
  String? companyId;
  String? createdBy;
  int? v;

  Question({
    this.faQs,
    this.id,
    this.companyId,
    this.createdBy,
    this.v,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        faQs: json["FAQs"] == null ? null : FaQs.fromJson(json["FAQs"]),
        id: json["_id"],
        companyId: json["companyId"],
        createdBy: json["createdBy"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "FAQs": faQs?.toJson(),
        "_id": id,
        "companyId": companyId,
        "createdBy": createdBy,
        "__v": v,
      };
}

class FaQs {
  String? question;
  String? answer;

  FaQs({
    this.question,
    this.answer,
  });

  factory FaQs.fromJson(Map<String, dynamic> json) => FaQs(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
