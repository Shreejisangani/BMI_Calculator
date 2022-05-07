import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_widget/iconcontent.dart';
import 'input_widget/reusable_card.dart';

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
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: const Color(0xffeb1555),
                          activeTrackColor: Colors.white,
                          overlayColor: const Color(0x29eb1555),  
                          inactiveTrackColor: const Color(0xff8d8e98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height=newValue.round();
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
                        children: const [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {},
                      colour: kActiveCardColour,
                      cardChild: Column(
                        children: const [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: kBottomContainerHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15.0),
              color: kBottomContainerColour,
              child: Text('Calculate',textAlign: TextAlign.center,style: kNumberTextStyle,),
            ),
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
