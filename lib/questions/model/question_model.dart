import 'package:adoe_testing/questions/model/answer_model.dart';

class Question {
  int id;
  String text;
  List<Answer> answers;
  Answer? selectedAnswer;

  Question({
    required this.id,
    required this.text,
    required this.answers,
    this.selectedAnswer
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        text: json["text"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}
