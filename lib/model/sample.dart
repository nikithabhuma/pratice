import 'package:flutter/material.dart';
import 'package:sample_bloc/home_page.dart';

class MyWidget extends StatelessWidget {
  final String question;
  final String answer;
  const MyWidget({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        customCard(question, answer),
        customCard(question, answer),
        customCard(question, answer),
        customCard(question, answer),
        customCard(question, answer),
        customCard(question, answer),
        samplecard()
      ],
    ));
  }
}
