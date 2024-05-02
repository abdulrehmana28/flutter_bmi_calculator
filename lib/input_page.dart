import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/card_content.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

// can't create enums inside a class
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;
  int userHeight = 180;

  void changeColor(Gender selectedGender) {
    selectedGender == Gender.male
        ? maleCardColor = kActiveCardColor
        : maleCardColor = kInActiveCardColor;
    selectedGender == Gender.female
        ? femaleCardColor = kActiveCardColor
        : femaleCardColor = kInActiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
        elevation: 5.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        changeColor(Gender.male);
                      });
                    },
                    cardColor: maleCardColor,
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        changeColor(Gender.female);
                      });
                    },
                    cardColor: femaleCardColor,
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Height',
                          style:
                              TextStyle(color: kCardTextColor, fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(userHeight.toString(), style: kNumberText),
                            const Text(
                              'cm',
                              style: TextStyle(
                                  color: kCardTextColor, fontSize: 20.0),
                            ),
                          ],
                        ),
                        Slider(
                            value: userHeight.toDouble(),
                            min: 150.0,
                            max: 220.0,
                            activeColor: kBottomButtonColor,
                            onChanged: (double newValue) {
                              setState(() {
                                userHeight = newValue.round();
                              });
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          cardColor: kActiveCardColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomButtonColor,
            margin: const EdgeInsets.only(top: 10.0),
            height: kBottomButtonHeight,
            width: double.infinity,
          ),
        ],
      ),

      // Custom theme for a specific widget
      /* floatingActionButton: Theme(
        data: ThemeData.dark(),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ), */
    );
  }
}
