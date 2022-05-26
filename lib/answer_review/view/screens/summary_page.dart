import 'package:adoe_testing/answer_review/view/widgets/question_review.dart';
import 'package:adoe_testing/answer_review/view/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class Summarypage extends StatelessWidget {
  const Summarypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Column(
            children: const [
              SummaryWidget(),
              SizedBox(height: 20),
              Expanded(
                child: QuestionReviewTabs(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
