import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_widget/bottom_button.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../input_widget/iconcontent.dart';
import '../input_widget/reusable_card.dart';
import '../input_widget/round_icon_btn.dart';

enum genderType { male, female, other }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;

  // //1=male ,2=female
  // void updateColour(genderType gender) {
  //   if (gender == genderType.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   if (gender == genderType.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //     } else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }
  genderType selectedGender = genderType.other;
  int height = 180;
  int wight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.male;
                        });
                      },
                      colour: selectedGender == genderType.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.female;
                        });
                      },
                      colour: selectedGender == genderType.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  onPress: () {},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline
                            .alphabetic, //baseline can't be null so always asign textbaseline property
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),

                      //here we not need to change thumb style but future references i change it.
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                          thumbColor: const Color(0xffeb1555),
                          activeTrackColor: Colors.white,
                          overlayColor: const Color(0x29eb1555),
                          inactiveTrackColor: const Color(0xff8d8e98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          // activeColor: const Color(0xffffffff),
                          // inactiveColor: const Color(0xff8d8e98),
                          min: 120.0,
                          max: 220.0,
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Wight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            wight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    wight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    wight++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'Calculate',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: wight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )),
                );
              },
            )
          ],
        )

        //we can apply theme here
        // floatingActionButton: Theme(
        //   // ignore: deprecated_member_use
        //   data: ThemeData(accentColor: const Color(0xffffffff),),
        //   child: FloatingActionButton(
        //     onPressed: () {},
        //     child: const Icon(Icons.add),
        //   ),
        // ),
        );
  }
}
