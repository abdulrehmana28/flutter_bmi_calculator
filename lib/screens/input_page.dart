import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/components/card_content.dart';
import 'package:flutter_bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculateFuncationality.dart';
import '../components/bottom_button.dart';
import '../components/raw_round_button.dart';
import '../constants.dart';
import 'result_page.dart';

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
  int userWeight = 60;
  int userAge = 25;

  void changeColor(Gender selectedGender) {
    selectedGender == Gender.male
        ? maleCardColor = kActiveCardColor
        : maleCardColor = kInActiveCardColor;
    selectedGender == Gender.female
        ? femaleCardColor = kActiveCardColor
        : femaleCardColor = kInActiveCardColor;
  }

  void plusWeight() {
    setState(() {
      userWeight++;
    });
  }

  void minusWeight() {
    setState(() {
      userWeight--;
    });
  }

  void plusAge() {
    setState(() {
      userAge++;
    });
  }

  void minusAge() {
    setState(() {
      userAge--;
    });
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
                            Text(userHeight.toString(),
                                style: kNumberTextStyle),
                            const Text(
                              'cm',
                              style: TextStyle(
                                  color: kCardTextColor, fontSize: 20.0),
                            ),
                          ],
                        ),
                        reusableSlider(),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style:
                              TextStyle(color: kCardTextColor, fontSize: 20.0),
                        ),
                        Text(userWeight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawRoundButton(
                              childIcon: FontAwesomeIcons.minus,
                              onPress: minusWeight,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RawRoundButton(
                              childIcon: FontAwesomeIcons.plus,
                              onPress: plusWeight,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          cardColor: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Age',
                                style: TextStyle(
                                    color: kCardTextColor, fontSize: 20.0),
                              ),
                              Text(userAge.toString(), style: kNumberTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawRoundButton(
                                    childIcon: FontAwesomeIcons.minus,
                                    onPress: minusAge,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  RawRoundButton(
                                    childIcon: FontAwesomeIcons.plus,
                                    onPress: plusAge,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'calculate',
            onClick: () {
              CalculateFuncationality calc = CalculateFuncationality(
                  height: userHeight, weight: userWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResultText(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
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

  SliderTheme reusableSlider() {
    return SliderTheme(
      data: const SliderThemeData(
        activeTrackColor: Colors.white,
        thumbColor: kBottomButtonColor,
        overlayColor: Color(0x29eb1555),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
      ),
      child: Slider(
        value: userHeight.toDouble(),
        min: 150.0,
        max: 220.0,
        onChanged: (double newValue) {
          setState(
            () {
              userHeight = newValue.round();
            },
          );
        },
      ),
    );
  }
}
