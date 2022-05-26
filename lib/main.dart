import 'package:adoe_testing/questions/controller/questions_constroller.dart';
import 'package:adoe_testing/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuestionController>(
            create: (_) => QuestionController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adeo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: GoogleFonts.montserratTextTheme().merge(
            Theme.of(context).textTheme.apply(
                  displayColor: Colors.white,
                  bodyColor: Colors.white,
                  fontSizeFactor: 1.1
                ),
          ),
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
