import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final String image;
  final void Function()? onPressed;
  const MainImage({
    super.key,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            image,
            width: 72,
            height: 72,
          ),
        ),
      ),
    );
  }
}
