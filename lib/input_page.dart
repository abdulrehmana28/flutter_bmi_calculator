import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/CardContent.dart';
import 'package:flutter_bmi_calculator/ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomButtonHeight = 70.0;
const bottomButtonColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1d1e33);
const inActiveCardColor = Color(0xffe111328);
const cardTextColor = Color(0xFF8D8E98);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;

  // 1 = male & 2 = female
  void changeColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
    } else if (gender == 2) {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      } else {
        femaleCardColor = inActiveCardColor;
      }
    }
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(1);
                      });
                    },
                    child: ReusableCard(
                      cardColor: maleCardColor,
                      cardChild: CardContent(
                        cardIcon: FontAwesomeIcons.mars,
                        cardText: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(2);
                      });
                    },
                    child: ReusableCard(
                      cardColor: femaleCardColor,
                      cardChild: CardContent(
                        cardIcon: FontAwesomeIcons.venus,
                        cardText: 'Female',
                      ),
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
                    cardColor: activeCardColor,
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
                    cardColor: activeCardColor,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          cardColor: activeCardColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomButtonColor,
            margin: const EdgeInsets.only(top: 10.0),
            height: bottomButtonHeight,
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
