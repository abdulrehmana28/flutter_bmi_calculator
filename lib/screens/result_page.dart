import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/components/reusable_card.dart';

import '../components/bottom_button.dart';
import '../constants.dart';
import '../database_helper.dart';
import 'SavedDataPage.dart';

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
              child: const Center(
                child: Text(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SavedDataPage(),
                            ),
                          );
                        },
                        child: const Text('View Saved'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kActiveCardColor),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final dbHelper = DatabaseHelper();
                          final nameController = TextEditingController();
                          await showDialog<String>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Enter your name'),
                                content: TextFormField(
                                  controller: nameController,
                                  decoration:
                                      const InputDecoration(labelText: 'Name'),
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context, nameController.text);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          await dbHelper.insertUser(nameController.text, gender,
                              age, height, weight, bmiResult);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedDataPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kActiveCardColor),
                        ),
                        child: const Text('Save Data'),
                      ),
                    ],
                  ),
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
