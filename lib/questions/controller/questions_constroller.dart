import 'package:adoe_testing/answer_review/view/screens/summary_page.dart';
import 'package:adoe_testing/questions/model/answer_model.dart';
import 'package:adoe_testing/utils/questions_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../model/question_model.dart';

class QuestionController with ChangeNotifier {
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  startQuestionTimer() {
    startTime = DateTime.now();
    endTime = DateTime.now().add(const Duration(minutes: 20));
    notifyListeners();
  }

  List<Question> questions = [];

  List<Question> attemptedQuestions = [];

  Question? selectedQuestion;

  ItemScrollController itemScrollController = ItemScrollController();

  int initialQuestionIndex = 0;
  int? selectedAnswerindex;

  setSelectedAnswerIndex(int position) {
    selectedAnswerindex = position;
    notifyListeners();
  }

  void setSelectedQuestion(Question question) {
    selectedQuestion = question;
    notifyListeners();
  }

  void nextQuestion() {
    if (initialQuestionIndex < questions.length - 1) {
      initialQuestionIndex++;
      selectedQuestion = questions[initialQuestionIndex];
      itemScrollController.scrollTo(
          index: initialQuestionIndex,
          duration: const Duration(milliseconds: 500));
      notifyListeners();
    } else {
      setEndTimer();
    }
  }

  setEndTimer() {
    Get.off(() => const Summarypage());
    endTime = DateTime.now();
    notifyListeners();
  }

  void previousQuestion() {
    if (initialQuestionIndex != 0) {
      initialQuestionIndex--;
      selectedQuestion = questions[initialQuestionIndex];
      itemScrollController.scrollTo(
          index: initialQuestionIndex,
          duration: const Duration(milliseconds: 500));
      notifyListeners();
    }
  }

  setSelectedAnswer(Answer answer) {
    selectedQuestion!.selectedAnswer = answer;
    Future.delayed(const Duration(milliseconds: 1000), () {
      nextQuestion();
    });
    notifyListeners();
  }

  // create a get request to get questions
  getQuestions() async {
    questions = [];
    notifyListeners();
    questions = sampleQuestions;
    for (var question in questions) {
      question.selectedAnswer = null;
    }
    // questions.shuffle();
    initialQuestionIndex = 0;
    selectedQuestion = null;
    notifyListeners();
    selectedQuestion = questions[initialQuestionIndex];
    notifyListeners();
  }
}
