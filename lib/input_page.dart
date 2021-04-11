import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

const iconMale = FontAwesomeIcons.mars;
const iconFamale = FontAwesomeIcons.venus;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color famaleCardColour = inactiveCardColour;

  //1 = male, 2=famale
  void updateColour(int gender) {
    //male card presse
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        famaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
        famaleCardColour = activeCardColour;
      }
    }

    //Female card press
    if (gender == 2) {
      if (famaleCardColour == inactiveCardColour) {
        famaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        famaleCardColour = inactiveCardColour;
        maleCardColour = activeCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                      print("Male Card press");
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: iconMale,
                        label: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                        cardChild: IconContent(
                          icon: iconFamale,
                          label: "Female",
                        ),
                        colour: famaleCardColour),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColour),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: activeCardColour),
              ),
              Expanded(
                child: ReusableCard(colour: activeCardColour),
              ),
            ],
          )),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
