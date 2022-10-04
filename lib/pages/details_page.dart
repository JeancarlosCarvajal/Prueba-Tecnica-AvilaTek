import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
   
  const DetailsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Color(0xFF00ACE6)),
              BoxShadow(color: Color(0xFF00E2A3)),
              
            ]
          ),
        ),
        centerTitle: true,
        title: Text( 'Latest' ),
      ),
      body: Center(
         child: Text('DetailsPage'),
      ),
    );
  }
}