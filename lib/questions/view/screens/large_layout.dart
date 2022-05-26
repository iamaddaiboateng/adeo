import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/questions/view/widgets/answers_options_widget.dart';
import 'package:adoe_testing/questions/view/widgets/choose_answer_widget.dart';
import 'package:adoe_testing/questions/view/widgets/question_answers_header.dart';
import 'package:adoe_testing/questions/view/widgets/question_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutQuestionScreen extends StatefulWidget {
  const LayoutQuestionScreen({Key? key}) : super(key: key);

  @override
  State<LayoutQuestionScreen> createState() => _LayoutQuestionScreenState();
}

class _LayoutQuestionScreenState extends State<LayoutQuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            QuestionAnswerHeader(),
            QuestionDisplayWidget(),
            ChooseAnswerWidget(),
            Expanded(
              child: AnswerOptionsWidget(),
            )
          ],
        ),
      ),
    );
  }
}
