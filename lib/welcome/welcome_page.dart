import 'package:adoe_testing/questions/view/screens/large_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../questions/controller/questions_constroller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Center(
                child: SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to the Adeo Experience",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lobster().copyWith(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.lato().copyWith(fontSize: 30),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'You currently have ',
                            ),
                            TextSpan(
                              text: 'NO ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'subscription',
                            )
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "First Take a diagnosis text to determine the right course for you",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const LayoutQuestionScreen());
                          Provider.of<QuestionController>(context,
                                  listen: false)
                              .getQuestions();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Text(
                            "Let's go",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.teal,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {
                  Get.to(() => const LayoutQuestionScreen());
                  Provider.of<QuestionController>(context, listen: false)
                      .getQuestions();
                },
                child: Container(
                  width: 100,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
