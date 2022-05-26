import 'package:adoe_testing/answer_review/view/widgets/question_review_list.dart';
import 'package:adoe_testing/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class QuestionReviewTabs extends StatefulWidget {
  const QuestionReviewTabs({Key? key}) : super(key: key);

  @override
  State<QuestionReviewTabs> createState() => _QuestionReviewTabsState();
}

class _QuestionReviewTabsState extends State<QuestionReviewTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: kQuestionBackgroundColor,
      child: Column(children: [
        TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              const Tab(
                text: "All",
              ),
              Tab(
                child: Row(children: const [
                  CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.done,
                      size: 8,
                    ),
                    radius: 5,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: Text(
                    "Correctly Answered",
                    style: TextStyle(fontSize: 11),
                  )),
                ]),
              ),
              Tab(
                child: Row(children: const [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      size: 8,
                    ),
                    radius: 5,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: Text(
                    "Wrongly Answered",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  )),
                ]),
              ),
              Tab(
                child: Row(children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.question_mark,
                      size: 8,
                    ),
                    radius: 4,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                      child: Text(
                    "Not Attempted",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  )),
                ]),
              ),
            ],
            controller: _tabController),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              QuestionReviewList(),
              QuestionReviewList(
                questionType: 'correct',
              ),
              QuestionReviewList(
                questionType: 'incorrect',
              ),
              QuestionReviewList(
                questionType: 'notAnswered',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
