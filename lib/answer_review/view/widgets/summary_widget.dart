import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/questions/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(
      builder: (_, question, __) {
        List<Question> questions = question.questions
            .where((element) =>
                element.selectedAnswer != null &&
                element.selectedAnswer!.value == 1)
            .toList();

        double totalScore = questions.length / question.questions.length * 100;
        String score = totalScore.toStringAsFixed(0);
        Duration timeTaken = question.endTime.difference(question.startTime);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SummaryWidgetItem(info: "$score%", title: "Score"),
            SummaryWidgetItem(
              info: "${timeTaken.inMinutes}m ${timeTaken.inSeconds % 60}s",
              title: "Time Taken",
            ),
            SummaryWidgetItem(
              info: "${question.questions.length}",
              title: "Questions",
            )
          ],
        );
      },
    );
  }
}

class SummaryWidgetItem extends StatelessWidget {
  final String info, title;

  const SummaryWidgetItem({required this.info, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          info,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
