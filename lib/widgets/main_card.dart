import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MainCard({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        margin: const EdgeInsets.all(12),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Tunisia',
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
