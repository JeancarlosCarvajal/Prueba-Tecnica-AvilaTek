import 'package:flutter/material.dart';

class CircularProgressMovie extends StatelessWidget {

  final double strokeWidth;
  final double widthHeight;
  const CircularProgressMovie({
    Key? key,
    this.strokeWidth = 10,
    this.widthHeight = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widthHeight,
        height: widthHeight,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: const Color.fromARGB(255, 0, 172, 230), 
          backgroundColor: const Color.fromARGB(255, 0, 226, 163),
        ),
      )
    );
  }
}
 