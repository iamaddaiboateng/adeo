import 'package:adoe_testing/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class ChooseAnswerWidget extends StatelessWidget {
  const ChooseAnswerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kChooseAnswerBackgroundColor,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text("Choose the right answer to the question above"),
      ),
    );
  }
}
