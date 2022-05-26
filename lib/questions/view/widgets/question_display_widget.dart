import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionDisplayWidget extends StatelessWidget {
  const QuestionDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(
      builder: (_, question, __) => Container(
        padding: const EdgeInsets.all(30),
        color: kQuestionBackgroundColor,
        child: Center(
          child: Text(
            question.selectedQuestion!.text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
