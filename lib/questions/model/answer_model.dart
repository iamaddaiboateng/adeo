class Answer {
  String text;
  int questionId, value, id;

  Answer({
    required this.text,
    required this.questionId,
    required this.id,
    required this.value,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        text: json["text"],
        questionId: json["question_id"],
        value: json["value"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "question_id": questionId,
        "value": value,
        "id": id,
      };
}
