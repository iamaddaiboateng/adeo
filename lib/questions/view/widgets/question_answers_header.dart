import 'package:adoe_testing/answer_review/view/screens/summary_page.dart';
import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/questions/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class QuestionAnswerHeader extends StatefulWidget {
  const QuestionAnswerHeader({Key? key}) : super(key: key);

  @override
  State<QuestionAnswerHeader> createState() => _QuestionAnswerHeaderState();
}

class _QuestionAnswerHeaderState extends State<QuestionAnswerHeader> {
  int selectedIndex = 1;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 20;
  late CountdownTimerController _controller;
  final ItemScrollController itemScrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CountdownTimerController(
        endTime: endTime,
        onEnd: () {
          Get.off(
            () => const Summarypage(),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(builder: (_, question, __) {
      return Container(
        height: 70,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 65,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: question.questions.length,
                  itemScrollController: question.itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  minCacheExtent: 1,
                  itemBuilder: (context, index) {
                    // print("new position is ${question.initialQuestionIndex}");
                    return question.initialQuestionIndex == index
                        ? selectedIndexText("${index + 1}")
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index + 1;
                                });
                              },
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Center(
                child: CountdownTimer(
                  controller: _controller,
                  endTime: endTime,
                  widgetBuilder: (context, time) {
                    return Text(
                      "${time?.min ?? 0} : ${time?.sec ?? 0}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    );
                  },
                  textStyle: const TextStyle(color: Colors.teal),
                ),
              ),
            )
          ],
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.teal,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      );
    });
  }

  Widget selectedIndexText(text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
