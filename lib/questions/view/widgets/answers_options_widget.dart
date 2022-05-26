import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/answer_model.dart';

class AnswerOptionsWidget extends StatefulWidget {
  const AnswerOptionsWidget({Key? key}) : super(key: key);

  @override
  State<AnswerOptionsWidget> createState() => _AnswerOptionsWidgetState();
}

class _AnswerOptionsWidgetState extends State<AnswerOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(
      builder: (_, question, __) => question.selectedQuestion == null
          ? Container()
          : Container(
              color: kAnswersBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: question.selectedQuestion!.answers.length,
                          itemBuilder: (context, index) {
                            Answer answer =
                                question.selectedQuestion!.answers[index];
                            return question.selectedQuestion == null
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      question.setSelectedAnswer(answer);
                                    },
                                    child: question.selectedQuestion
                                                    ?.selectedAnswer !=
                                                null &&
                                            question.selectedQuestion!
                                                    .selectedAnswer?.id ==
                                                answer.id
                                        ? selectedAnswerWidget(answer.text)
                                        : Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              answer.text,
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                  );
                          }),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: question.initialQuestionIndex == 0
                                ? null
                                : () {
                                    question.previousQuestion();
                                  },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 10,
                              ),
                              child: Text("Previous"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              question.nextQuestion();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 10,
                              ),
                              child: Text(question.initialQuestionIndex ==
                                      question.questions.length - 1
                                  ? "Submit"
                                  : "Next"),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  selectedAnswerWidget(String text) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 23),
      ),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.blue,
        ),
      ),
    );
  }
}
