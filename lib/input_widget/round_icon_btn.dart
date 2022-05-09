import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 6.0,
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}