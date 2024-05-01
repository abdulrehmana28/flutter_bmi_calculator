import 'package:flutter/material.dart';

const bottomButtonHeight = 70.0;
const bottomButtonColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1d1e33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    cardColor: activeCardColor,
                  ),
                ),
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

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardColor});

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: cardColor),
    );
  }
}

// const Color(0xFF1d1e33),
