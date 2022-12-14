import 'package:flutter/material.dart';


class LeadingWidget extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed; 
  final Color color;
  final double margin;

  const LeadingWidget({
    Key? key, 
    required this.icon, 
    required this.onPressed, 
    this.color = Colors.white, 
    this.margin = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(margin),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), 
            gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [ 
              Color.fromARGB(255, 0, 172, 230),
              Color.fromARGB(255, 0, 226, 163)  
              ]
            ), 
          ),
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(30), 
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                child: Center(
                  child: Icon(icon, size: 20, color: color)
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
} 
 