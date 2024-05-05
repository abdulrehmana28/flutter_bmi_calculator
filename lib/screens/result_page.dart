import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/components/reusable_card.dart';

import '../components/bottom_button.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String age;
  final String weight;
  final String height;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: const Text(
                  'Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBmiInterpretationTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(gender),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'Re-Calculate',
            onClick: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
