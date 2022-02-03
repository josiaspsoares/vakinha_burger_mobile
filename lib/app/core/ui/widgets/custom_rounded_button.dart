import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomRoundedButton({
    Key? key,
    required this.text,
    this.fontSize = 25,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const CircleBorder(),
      ),
    );
  }
}
