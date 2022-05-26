import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/questions/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionReviewList extends StatelessWidget {
  final String? questionType;
  const QuestionReviewList({this.questionType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(
      builder: (_, question, __) {
        List<Question> questions = question.questions;

        if (questionType == "correct") {
          questions = questions
              .where((element) =>
                  element.selectedAnswer != null &&
                  element.selectedAnswer!.value == 1)
              .toList();
        } else if (questionType == "incorrect") {
          questions = questions
              .where((element) =>
                  element.selectedAnswer != null &&
                  element.selectedAnswer!.value == 0)
              .toList();
        } else if (questionType == "notAnswered") {
          questions = questions
              .where((element) => element.selectedAnswer == null)
              .toList();
        } else {
          questions = question.questions;
        }

        return ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: questions.length,
          itemBuilder: ((context, index) {
            return QuestionReviewListItem(
              question: questions[index],
              index: question.questions.indexOf(questions[index]) + 1,
            );
          }),
        );
      },
    );
  }
}

class QuestionReviewListItem extends StatelessWidget {
  final Question question;
  final int index;
  const QuestionReviewListItem(
      {required this.question, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "$index.",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(question.text),
              trailing: getCircularAvatar(question.selectedAnswer?.value ?? -1),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.blue,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  getCircularAvatar(int value) {
    if (value == 1) {
      return const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.done,
          size: 20,
        ),
        radius: 15,
      );
    } else if (value == 0) {
      return const CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.close,
          size: 20,
        ),
        radius: 15,
      );
    } else {
      return const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.question_mark,
          size: 20,
        ),
        radius: 15,
      );
    }
  }
}
