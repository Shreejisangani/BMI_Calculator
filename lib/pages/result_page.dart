import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_widget/reusable_card.dart';
import 'package:flutter/material.dart';
import '../input_widget/bottom_button.dart';


class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({Key? key,required this.bmiResult, required this.resultText, required this.interpretation,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        // backgroundColor: Colors.transparent,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result!',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                onPress: () {},
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kResultNumberTextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBMIBodyTextStyle,
                      )
                    ]),
              ),
            ),
            BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              buttonTitle: 'Re-Calculate',
            ),
          ]),
    );
  }
}

