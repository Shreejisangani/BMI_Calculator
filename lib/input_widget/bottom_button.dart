import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  const BottomButton({Key? key, required this.buttonTitle, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 15.0),
        margin: const EdgeInsets.only(top: 15.0),
        color: kBottomContainerColour,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
