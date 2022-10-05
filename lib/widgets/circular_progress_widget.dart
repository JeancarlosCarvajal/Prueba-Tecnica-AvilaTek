import 'package:flutter/material.dart';

class CircularProgressMovie extends StatelessWidget {
  const CircularProgressMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          strokeWidth: 10,
          color: Color.fromARGB(255, 0, 172, 230), 
          backgroundColor: Color.fromARGB(255, 0, 226, 163),
        ),
      )
    );
  }
}
 