import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final void Function()? onPressed;
  const MainButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(64),
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Tunisia',
          fontSize: 24,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
